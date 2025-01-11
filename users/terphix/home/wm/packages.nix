{ pkgs, ... }:
{
  home.packages = with pkgs; [
    pamixer
    wl-clipboard
    brightnessctl
  ];
}
