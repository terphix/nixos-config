{ pkgs, ... }:
{
  home.pointerCursor = {
    x11.enable = true;
    gtk.enable = true;
    name = "catppuccin-macchiato-dark-cursors";
    package = pkgs.catppuccin-cursors.macchiatoDark;
    size = 28;
  };
}
