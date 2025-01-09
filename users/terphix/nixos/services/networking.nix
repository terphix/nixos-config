{ userConfig, ... }:
let
  hostName = userConfig.hostname;
in
{
  networking = {
    inherit hostName;
    networkmanager.enable = true;
  };
}
