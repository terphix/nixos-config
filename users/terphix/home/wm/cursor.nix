{ pkgs, ... }:
{
  gtk.cursorTheme = {
    package = pkgs.catppuccin-cursors.macchiatoDark;
    name = "catppuccin-macchiato-dark-cursors";
    size = 28;
  };

  home.pointerCursor = {
    name = "catppuccin-macchiato-dark-cursors";
    package = pkgs.catppuccin-cursors.macchiatoDark;
    size = 28;
  };
}
