{
  pkgs,
  userConfig,
  ...
}:
let
  userName = userConfig.username;
  userEmail = userConfig.publicEmail;
in
{
  programs.git = {
    enable = true;
    package = pkgs.gitAndTools.gitFull;
    lfs.enable = true;
    inherit userName userEmail;
    aliases = {
      aa = "add --all";
      cm = "commit -m";
      ch = "checkout";
      br = "branch";
      s = "status";
      uncommit = "reset --soft HEAD^";
      unadd = "reset";
    };
    extraConfig = {
      init = {
        defaultbranch = "main";
      };
      branch = {
        soft = "-committerdate";
      };
      pull.rebase = true;
      diff.sopsdiffer.textconv = "sops --decrypt --config /dev/null";
    };
  };
}
