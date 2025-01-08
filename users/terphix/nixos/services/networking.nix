{ userConfig, ... }:
let
  inherit (userConfig) hostName;
in
{
  networking = {
    inherit hostName;
    networkmanager.enable = true;
  };
}
