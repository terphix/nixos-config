{ pkgs, ... }:
{
  home.packages = with pkgs; [
    master.ayugram-desktop
  ];
}
