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

  ####################
  ### Special args ###
  ####################
  specialArgs = { inherit inputs customLib userConfig; };
in
nixpkgs.lib.nixosSystem {
  inherit system specialArgs;

  modules = [
    # System modules
    machineConfig
    systemConfig
    {
      nixpkgs = {
        config = packagesConfig;
        overlays = [
          overlays.stable-packages
          overlays.master-packages
        ];
      };
    }

    # Sops for secrets
    inputs.sops-nix.nixosModules.sops
    {
      sops = {
        defaultSopsFormat = "yaml";
        defaultSopsFile = ../secrets/secrets.yaml;
        age.keyFile = "/home/${username}/.config/sops/age/keys.txt";
      };
    }

    # Home Manager
    inputs.home-manager.nixosModules.home-manager
    {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.extraSpecialArgs = specialArgs;
      home-manager.users.${username} = import homeConfig;
    }
  ];
}
