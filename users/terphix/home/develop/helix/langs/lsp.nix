{ pkgs, ... }:
{
  programs.helix.languages.language-server = {
    ###########
    ### Nix ###
    ###########
    nixd = {
      command = "${pkgs.stable.nixd}/bin/nixd";
    };

    ############
    ### Rust ###
    ############
    rust-analyzer = {
      command = "${pkgs.stable.rust-analyzer}/bin/rust-analyzer";
    };

    ##############
    ### Python ###
    ##############
    ruff-lsp = {
      command = "${pkgs.ruff-lsp}/bin/ruff-lsp";
    };
  };
}
