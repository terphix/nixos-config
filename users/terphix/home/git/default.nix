{ pkgs, userConfig, ... }:
let
  inherit (userConfig) user userEmail;
in
{
  programs.git = {
    enable = true;
    package = pkgs.gitAndTools.gitFull;
    lfs.enable = true;
    userName = "${user}";
    userEmail = "${userEmail}";
    aliases = {
      aa = "add --all";
      cm = "commit -m";
      ch = "checkout";
      br = "branch";
      s = "status";
      uncommit = "reset --soft head^";
      unadd = "reset";
    };
    extraConfig = {
      init = {
        defaultbranch = "main";
      };
      branch = {
        soft = "-committerdate";
      };
    };
  };
}
