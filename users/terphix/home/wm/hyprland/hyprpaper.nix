{
  pkgs,
  userConfig,
  ...
}:
let
  inherit (userConfig.paths) wallpapers;
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
        "${wallpapers}/Tokyo.png"
      ];
      wallpaper = [
        ", ${wallpapers}/Tokyo.png"
      ];
    };
  };
}
