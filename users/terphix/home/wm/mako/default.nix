{ pkgs, ... }:
{
  services.mako = {
    enable = true;
    package = pkgs.mako;
    borderRadius = 10;
    borderSize = 3;
    defaultTimeout = 15000;
    font = "JetBrainsMono Nerd Font 12";
  };

  catppuccin.mako = {
    enable = true;
    flavor = "macchiato";
  };
}
