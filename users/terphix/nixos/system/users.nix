{ config, ... }:
{
  sops.secrets."terphix/hashedPassword" = {
    neededForUsers = true;
    owner = config.users.users.terphix.name;
  };

  users.users = {
    terphix = {
      isNormalUser = true;
      description = "TerphiX";
      extraGroups = [
        "networkmanager"
        "wheel"
      ];
      hashedPasswordFile = config.sops.secrets."terphix/hashedPassword".path;
    };
  };
}
