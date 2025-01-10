{ pkgs, userConfig, ... }:
let
  PASSWORD_STORE_DIR = userConfig.passwordStorePath;
in
{
  programs.password-store = {
    enable = true;
    package = pkgs.pass;
    settings = {
      inherit PASSWORD_STORE_DIR;
      PASSWORD_STORE_CLIP_TIME = "60";
    };
  };
}