{
  username,
  hostname,
  system,
}:
let
  homeDirectory = "/home/${username}";
in
{
  # Main info
  inherit
    username
    hostname
    system
    homeDirectory
    ;

  publicEmail = "terphix.code@yahoo.com";

  # Paths
  configPath = "${homeDirectory}/projects/nixos-config";
  wallpapersPath = "${homeDirectory}/pictures/wallpapers";
  screenshotsPath = "${homeDirectory}/pictures/screenshots";

  gpgPath = "${homeDirectory}/.gpg";
  passwordStorePath = "${homeDirectory}/.passwords";
}
