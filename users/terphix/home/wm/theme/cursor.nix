{ pkgs, ... }:
{
  gtk.cursorTheme = {
    package = pkgs.catppuccin-cursors.macchiatoDark;
    name = "catppuccin-macchiato-dark-cursors";
    size = 28;
  };

  home.pointerCursor = {
    x11.enable = true;
    gtk.enable = true;
    name = "catppuccin-macchiato-dark-cursors";
    package = pkgs.catppuccin-cursors.macchiatoDark;
    size = 28;
  };
}
