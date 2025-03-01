{
  description = "My NixOS Configuration";

  inputs = {
    ###############################
    ### Official NixOS packages ###
    ###############################
    # Primary unstable nixpkgs repository
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Stable nixpkgs repository
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.11";

    # Master nixpkgs repository
    nixpkgs-master.url = "github:nixos/nixpkgs";

    ####################
    ### Home Manager ###
    ####################
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ################
    ### Hardware ###
    ################
    nixos-hardware = {
      url = "github:nixos/nixos-hardware";
    };

    ####################
    ### NUR Packages ###
    ####################
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ################
    ### ArkenFox ###
    ################
    arkenfox = {
      url = "github:dwarfmaster/arkenfox-nixos";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ################
    ### Sops-Nix ###
    ################
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ################
    ### Hyprland ###
    ################
    hyprland = {
      url = "github:hyprwm/Hyprland";
    };

    ####################
    ### Helix Editor ###
    ####################
    helix = {
      url = "github:helix-editor/helix";
    };

    ###############
    ### NixCord ###
    ###############
    nixcord = {
      url = "github:kaylorben/nixcord";
    };

    ##################
    ### Catppuccin ###
    ##################
    catppuccin = {
      url = "github:catppuccin/nix";
    };
  };

  outputs =
    {
      nixpkgs,
      nixpkgs-stable,
      nixpkgs-master,
      ...
    }@inputs:
    let
      inherit (nixpkgs) lib;

      mkSystem = import ./lib/mksystem.nix {
        inherit
          lib
          inputs
          nixpkgs
          nixpkgs-stable
          nixpkgs-master
          ;
      };
    in
    ######################
    ### Configurations ###
    ######################
    # Main laptop
    {
      nixosConfigurations.thinky = mkSystem "thinkbook-16-g6" {
        system = "x86_64-linux";
        username = "terphix";
        hostname = "thinky";
      };
    };
}
