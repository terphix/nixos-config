{ pkgs, ... }:
{
  security.pam = {
    package = pkgs.pam;
    services = {
      hyprlock = { };
    };
  };
}
