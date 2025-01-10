{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nekoray
    hyprpolkitagent
  ];
}
