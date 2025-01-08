{ pkgs, userConfig, ... }:
let
  inherit (userConfig) wallpapersDir;
in
{
  services.hyprpaper = {
    enable = true;
    package = pkgs.hyprpaper;
    settings = {
      ipc = "on";
      splash = false;
      splash_offset = 2.0;
      preload = [
        "${wallpapersDir}/Tokyo.png"
      ];
      wallpaper = [
        ", ${wallpapersDir}/Tokyo.png"
      ];
    };
  };
}
