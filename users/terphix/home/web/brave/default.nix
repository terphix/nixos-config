{ pkgs, ... }:
{
  programs.chromium = {
    enable = true;
    package = pkgs.stable.brave;
  };
}
