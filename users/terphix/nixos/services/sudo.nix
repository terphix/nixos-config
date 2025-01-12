{
  pkgs,
  userConfig,
  ...
}:
let
  inherit (userConfig) username;
in
{
  security = {
    sudo.enable = false;
    sudo-rs = {
      enable = true;
      package = pkgs.sudo-rs;
      wheelNeedsPassword = true;
      extraRules = [
        {
          users = [ username ];
          commands = [ "ALL" ];
        }
      ];
    };
  };
}
