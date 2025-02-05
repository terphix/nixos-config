{ pkgs, ... }:
{
  home.packages = with pkgs; [
    stable.libreoffice-qt-fresh
  ];
}
