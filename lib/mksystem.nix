{
  inputs,
  nixpkgs,
  nixpkgs-unstable,
}:

machine:
{
  user,
  hostName,
  system,
}:
let
  ######################
  ### System Configs ###
  ######################
  # Standart
  machineConfig = ../machines/${machine};
  systemConfig = ../users/${user}/nixos;
  homeConfig = ../users/${user}/home;

  # Additional
  userConfig = import ../users/${user}/config {
    inherit
      user
      hostName
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
  specialArgs = { inherit userConfig; };

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
        age.keyFile = "/home/${user}/.config/sops/age/keys.txt";
      };
    }

    # Home Manager
    inputs.home-manager.nixosModules.home-manager
    {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.extraSpecialArgs = { inherit userConfig; };
      home-manager.users.${user} = import homeConfig { inherit inputs; };
    }
  ];
}
