{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nekoray
    polkit-kde-agent
  ];
}
