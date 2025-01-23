{
  system,
  username,
  hostname,
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
  configPath = "${homeDirectory}/projects/personal/nixos-config";
  wallpapersPath = "${homeDirectory}/pictures/wallpapers";
  downloadsPath = "${homeDirectory}/downloads";
  screenshotsPath = "${homeDirectory}/pictures/screenshots";

  gpgPath = "${homeDirectory}/.gpg";
  passwordStorePath = "${homeDirectory}/.passwords";
}
