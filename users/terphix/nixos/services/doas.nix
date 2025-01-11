{ userConfig, ... }:
let
  inherit (userConfig) username;
in
{
  security = {
    sudo.enable = false;
    doas = {
      enable = true;
      extraRules = [
        {
          users = [ username ];
          keepEnv = true;
          persist = true;
        }
      ];
    };
  };
}
