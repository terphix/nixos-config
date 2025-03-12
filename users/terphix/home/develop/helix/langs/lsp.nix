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
    ruff = {
      command = "${pkgs.ruff}/bin/ruff";
      args = [ "server" ];
      config.settings = {
        lineLength = 89;
        logLevel = "debug";
      };
    };
  };
}
