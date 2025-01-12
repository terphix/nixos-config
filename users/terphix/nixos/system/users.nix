{
  config,
  userConfig,
  ...
}:
let
  name = userConfig.username;
  home = userConfig.homeDirectory;
  hashedPasswordFile = config.sops.secrets."terphix/hashedPassword".path;
in
{
  # Sops settings for user password
  sops.secrets."terphix/hashedPassword" = {
    neededForUsers = true;
    owner = name;
  };

  users.users = {
    terphix = {
      inherit name;
      isNormalUser = true;
      description = "Terphix";

      inherit home;
      createHome = true;
      homeMode = "700";

      extraGroups = [
        "networkmanager"
      ];

      inherit hashedPasswordFile;
    };
  };
}
