{ pkgs, userConfig, ... }:
let
  homedir = userConfig.gpgPath;
in
{
  programs.gpg = {
    enable = true;
    package = pkgs.gnupg;
    mutableKeys = true;
    mutableTrust = true;
    inherit homedir;
    settings = {
      no-comments = true;
      throw-keyids = true;
      no-emit-version = true;
      keyid-format = "0xlong";
    };
  };

  services.gpg-agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-qt;
  };
}
