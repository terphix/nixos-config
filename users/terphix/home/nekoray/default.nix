{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nekoray
    master.hyprpolkitagent
  ];
}
