{
  system,
  username,
  hostname,
}:
{
  # Main info
  inherit
    username
    hostname
    system
    ;

  # Additional info
  publicEmail = "terphix.code@yahoo.com";

  # All main paths
  paths = import ./paths.nix { inherit username; };
}
