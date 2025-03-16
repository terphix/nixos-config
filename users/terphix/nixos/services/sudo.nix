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
    sudo.enable = true;
    sudo-rs = {
      enable = false;
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
