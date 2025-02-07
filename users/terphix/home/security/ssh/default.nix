{
  pkgs,
  config,
  ...
}:
let
  # All secure info for guppy server
  guppyInfo = config.sops.secrets."terphix/guppy_server/info".path;

  # SSH key for guppy server
  guppyKey = config.sops.secrets."terphix/guppy_server/ssh_key".path;
in
{
  # Sops encrypted ssh keys for servers
  sops.secrets."terphix/guppy_server/ssh_key" = { };
  sops.secrets."terphix/guppy_server/info" = { };

  programs.ssh = {
    enable = true;
    package = pkgs.openssh;
    hashKnownHosts = true;

    matchBlocks = {
      "guppy" = {
        identityFile = guppyKey;
      };
    };
    includes = [
      guppyInfo
    ];
  };
}
