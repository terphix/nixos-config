{
  description = "My NixOS Configuration";

  inputs = {
    ###############################
    ### Official NixOS packages ###
    ###############################
    # Stable packages
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";

    # Unstable packages
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    ####################
    ### Home Manager ###
    ####################
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
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
      nixpkgs-unstable,
      ...
    }@inputs:
    let
      mkSystem = import ./lib/mksystem.nix {
        inherit
          inputs
          nixpkgs
          nixpkgs-unstable
          ;
      };
    in
    ######################
    ### Configurations ###
    ######################
    # Main laptop
    {
      nixosConfigurations.thinky = mkSystem "thinkbook-16-g6" {
        username = "terphix";
        hostname = "thinky";
        system = "x86_64-linux";
      };
    };
}
