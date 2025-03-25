{
  pkgs,
  customLib,
  userConfig,
  ...
}:
let
  inherit (userConfig) username;
  inherit (userConfig.paths) homeDirectory;
in
{
  imports = (customLib.scanPaths ./.);

  home = {
    inherit username homeDirectory;
    stateVersion = "24.11";
    packages = with pkgs; [ monero-gui ];

    # Custom notify about succesful system update
    activation.rebuildFinish = ''
      run ${pkgs.libnotify}/bin/notify-send "NixOS: Rebuild finished!" -t 5000 -i "${pkgs.papirus-icon-theme}/share/icons/Papirus-Dark/64x64/apps/nix-snowflake.svg"
    '';
  };
}
