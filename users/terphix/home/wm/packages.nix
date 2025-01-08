{ pkgs, ... }:
{
  home.packages = with pkgs; [
    hyprpicker
    hyprshot
    wl-clipboard
    brightnessctl
  ];
}
