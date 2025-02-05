{
  pkgs,
  inputs,
  customLib,
  userConfig,
  ...
}:
let
  inherit (userConfig) username;
  inherit (userConfig.paths) config homeDirectory;
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
      inherit config;
    };
    packages = with pkgs; [
      zip
      nvd
      lsd
      bat
      dust
      unzip
      sing-box
      nix-init
      fastfetch
      nix-prefetch-github
    ];
  };
}
