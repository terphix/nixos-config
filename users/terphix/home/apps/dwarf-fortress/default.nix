{ pkgs, ... }:
{
  home.packages = with pkgs; [ dwarf-fortress ];
}
