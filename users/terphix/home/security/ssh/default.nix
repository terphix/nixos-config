{
  pkgs,
  config,
  ...
}:
let
  # Sops encrypted values for my servers
  ## Guppy
  guppyInfo = config.sops.secrets."terphix/guppy_server/info".path;
  guppyKey = config.sops.secrets."terphix/guppy_server/ssh_key".path;

  # Servix
  servixInfo = config.sops.secrets."terphix/servix/info".path;
  servixKey = config.sops.secrets."terphix/servix/ssh_key".path;

  # SSH keys for Git
  githubKey = config.sops.secrets."terphix/github/ssh_key".path;
  forgejoKey = config.sops.secrets."terphix/forgejo/ssh_key".path;
in
{
  # Sops encrypted values for my servers
  ## Guppy
  sops.secrets."terphix/guppy_server/info" = { };
  sops.secrets."terphix/guppy_server/ssh_key" = { };

  ## Servix
  sops.secrets."terphix/servix/info" = { };
  sops.secrets."terphix/servix/ssh_key" = { };

  # Keys for Git
  sops.secrets."terphix/github/ssh_key" = { };
  sops.secrets."terphix/forgejo/ssh_key" = { };

  programs.ssh = {
    enable = true;
    package = pkgs.openssh;
    hashKnownHosts = true;

    matchBlocks = {
      "guppy" = {
        identityFile = guppyKey;
        identitiesOnly = true;
      };
      "servix" = {
        identityFile = servixKey;
        identitiesOnly = true;
      };
      "github.com" = {
        user = "git";
        hostname = "github.com";
        identityFile = githubKey;
        identitiesOnly = true;
      };
      "terphix.duckdns.org" = {
        user = "git";
        hostname = "terphix.duckdns.org";
        port = 222;
        identityFile = forgejoKey;
        identitiesOnly = true;
      };
    };
    includes = [
      guppyInfo
      servixInfo
    ];
  };
}
