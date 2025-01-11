{
  pkgs,
  inputs,
  customLib,
  userConfig,
  ...
}:
let
  inherit (userConfig) configPath;
  username = userConfig.username;
  homeDirectory = userConfig.homeDirectory;
in
{
  imports = (customLib.scanPaths ./.) ++ [
    inputs.catppuccin.homeManagerModules.catppuccin
  ];

  # Configure home
  home = {
    inherit username homeDirectory;
    stateVersion = "24.11";
    sessionVariables = {
      config = configPath;
    };
    packages = with pkgs; [
      age
      lsd
      sops
      fastfetch
      efibootmgr
    ];
  };
}
