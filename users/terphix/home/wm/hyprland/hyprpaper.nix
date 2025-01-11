{
  pkgs,
  userConfig,
  ...
}:
let
  inherit (userConfig) wallpapersPath;
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
        "${wallpapersPath}/Tokyo.png"
      ];
      wallpaper = [
        ", ${wallpapersPath}/Tokyo.png"
      ];
    };
  };
}
