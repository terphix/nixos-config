{ pkgs, ... }:
{
  home.packages = with pkgs; [
    python311Full
    # python311Packages.tkinter
  ];
}
