{ inputs, userConfig, ... }:
let
  hyprlandPackages = inputs.hyprland.packages.${userConfig.system};
in
{
  programs.hyprland = {
    enable = true;
    package = hyprlandPackages.hyprland;
    portalPackage = hyprlandPackages.xdg-desktop-portal-hyprland;
  };
}
