{ inputs }:
{ pkgs, userConfig, ... }:
let
  inherit (userConfig) user configDir;
in
{
  imports =
    [
      ./wm
      ./git
      ./yazi
      ./btop
      ./brave
      ./langs
      ./kitty
      ./helix
    ]
    ++ [
      inputs.catppuccin.homeManagerModules.catppuccin
    ];

  # Configure home
  home = {
    username = "${user}";
    homeDirectory = "/home/${user}";
    stateVersion = "24.11";
    sessionVariables = {
      config = "${configDir}";
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
