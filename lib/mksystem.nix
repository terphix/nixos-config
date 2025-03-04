{
  lib,
  inputs,
  nixpkgs,
  nixpkgs-stable,
  nixpkgs-master,
}:

machine:
{
  system,
  username,
  hostname,
}:
let
  ######################
  ### System Configs ###
  ######################
  # Standart
  machineConfig = ../machines/${machine};
  systemConfig = ../users/${username}/nixos;
  homeConfig = ../users/${username}/home;

  # Additional
  userConfig = import ../users/${username}/config {
    inherit
      username
      hostname
      system
      ;
  };

  ########################
  ### Custom functions ###
  ########################
  customLib = import ../lib/scanpaths.nix { inherit lib; };

  #################
  #### Packages ###
  #################
  packages = import ../packages { inherit lib; };

  # Config
  packagesConfig = packages.config;

  # Overlays
  overlays = import ../overlays {
    inherit
      nixpkgs-stable
      nixpkgs-master
      system
      packagesConfig
      ;
  };

  #####################
  ### Sops settings ###
  #####################
  sops = {
    defaultSopsFormat = "yaml";
    defaultSopsFile = ../secrets/secrets.yaml;
    age.keyFile = "/home/${username}/.sec/age/keys.txt";
  };

  ####################
  ### Special args ###
  ####################
  specialArgs = {
    inherit
      inputs
      customLib
      userConfig
      ;
  };
in
nixpkgs.lib.nixosSystem {
  inherit system specialArgs;

  modules = [
    ######################
    ### System modules ###
    ######################
    systemConfig
    machineConfig

    ####################
    ### Home Manager ###
    ####################
    inputs.home-manager.nixosModules.home-manager
    {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.extraSpecialArgs = specialArgs;
      home-manager.sharedModules = [
        inputs.sops-nix.homeManagerModules.sops
      ];
      home-manager.users.${username} = import homeConfig;
    }

    ####################
    ### Nix packages ###
    ####################
    {
      nixpkgs = {
        config = packagesConfig;
        overlays = [
          inputs.nur.overlays.default
          inputs.nix-vscode-extensions.overlays.default
          overlays.stable-packages
          overlays.master-packages
        ];
      };
    }

    ################
    ### Sops-nix ###
    ################
    # System settings
    inputs.sops-nix.nixosModules.sops
    {
      inherit sops;
    }

    # Home manager settings
    {
      home-manager.users.${username} = {
        inherit sops;
      };
    }
  ];
}
