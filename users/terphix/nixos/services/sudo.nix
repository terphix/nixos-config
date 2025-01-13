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
    sudo-rs = {
      enable = true;
      package = pkgs.sudo-rs;
      execWheelOnly = false;
      extraRules = [
        {
          users = [ username ];
          commands = [ "ALL" ];
        }
      ];
    };
  };
}
