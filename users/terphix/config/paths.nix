{ username }:
let
  homeDirectory = "/home/${username}";
  config = "${homeDirectory}/projects/nixos-config";
in
{
  inherit homeDirectory config;
  wallpapers = "${homeDirectory}/pictures/wallpapers";
  downloads = "${homeDirectory}/downloads";
  screenshots = "${homeDirectory}/pictures/screenshots";

  gpg = "${homeDirectory}/.sec/gpg";
  passwordStore = "${homeDirectory}/.sec/passwords";
}
