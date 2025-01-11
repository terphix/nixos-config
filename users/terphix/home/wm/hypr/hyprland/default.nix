{ customLib, ... }:
{
  imports = (customLib.scanPaths ./.);

  wayland.windowManager.hyprland = {
    enable = true;
    settings.monitor = ", 1920x1200@60, auto, 1.2";
  };
}
