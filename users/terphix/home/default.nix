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
      nix-init
      fastfetch
      libnotify
      nix-prefetch-github
    ];
    activation.rebuildFinish = ''
      run ${pkgs.libnotify}/bin/notify-send "NixOS: Rebuild finished!" -t 5000 -i "${pkgs.papirus-icon-theme}/share/icons/Papirus-Dark/128x128/apps/nix-snowflake.svg"
    '';
  };
}
