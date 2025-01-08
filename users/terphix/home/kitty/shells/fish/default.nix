{ pkgs, ... }:
{
  imports = [
    ./aliases.nix
    ./functions.nix
    ./plugins.nix
  ];

  programs.fish = {
    enable = true;
    package = pkgs.fish;
  };
}
