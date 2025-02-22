{ username }:
let
  homeDirectory = "/home/${username}";
in
{
  inherit homeDirectory;
  config = "${homeDirectory}/projects/nixos-config";
  wallpapers = "${homeDirectory}/pictures/wallpapers";
  downloads = "${homeDirectory}/downloads";
  screenshots = "${homeDirectory}/pictures/screenshots";

  gpg = "${homeDirectory}/.sec/gpg";
  passwordStore = "${homeDirectory}/.sec/passwords";
}
