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

  # SSH key for Github
  githubKey = config.sops.secrets."terphix/github/ssh_key".path;

  gitlabKey = config.sops.secrets."terphix/gitlab/ssh_key".path;
in
{
  # Sops encrypted values for my servers
  sops.secrets."terphix/guppy_server/ssh_key" = { };
  sops.secrets."terphix/guppy_server/info" = { };

  # Sops encrypted keys for my github
  sops.secrets."terphix/github/ssh_key" = { };

  # Key for Gitlab
  sops.secrets."terphix/gitlab/ssh_key" = { };

  programs.ssh = {
    enable = true;
    package = pkgs.openssh;
    hashKnownHosts = true;

    matchBlocks = {
      "guppy" = {
        identityFile = guppyKey;
        identitiesOnly = true;
      };
      "github.com" = {
        user = "git";
        hostname = "github.com";
        identityFile = githubKey;
        identitiesOnly = true;
      };
      "gitlab.com" = {
        hostname = "gitlab.com";
        identityFile = gitlabKey;
        identitiesOnly = true;
      };
    };
    includes = [
      guppyInfo
    ];
  };
}
