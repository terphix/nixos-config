{
  inputs,
  nixpkgs,
  nixpkgs-unstable,
}:

machine:
{
  username,
  hostname,
  system,
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

  #################
  #### Packages ###
  #################
  packages = import ../packages { };

  # Config
  packagesConfig = packages.config;

  # Overlays
  # FIXME: Make import list of overlays
  overlays = import ../overlays {
    inherit
      nixpkgs-unstable
      system
      packagesConfig
      ;
  };
in
nixpkgs.lib.nixosSystem {
  inherit system;
  specialArgs = { inherit userConfig inputs; };

  modules = [
    # System modules
    machineConfig
    systemConfig
    {
      nixpkgs = {
        config = packagesConfig;
        overlays = [ overlays.unstable-packages ];
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
      home-manager.extraSpecialArgs = { inherit userConfig inputs; };
      home-manager.users.${username} = import homeConfig;
    }
  ];
}
