{
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    inputs.nixcord.homeManagerModules.nixcord
  ];

  programs.nixcord = {
    enable = true;
    discord = {
      enable = true;
      package = pkgs.discord;
      vencord.enable = true;
      openASAR.enable = false;
    };
    config = {
      transparent = true;
      frameless = true;
      themeLinks = [
        "https://catppuccin.github.io/discord/dist/catppuccin-macchiato.theme.css"
      ];
    };
  };
}
