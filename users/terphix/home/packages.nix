{ pkgs, ... }:
{
  home.packages = with pkgs; [
    zip
    nvd
    lsd
    bat
    dust
    unzip
    nix-init
    fastfetch
    libnotify
    nix-prefetch-github
  ];
}
