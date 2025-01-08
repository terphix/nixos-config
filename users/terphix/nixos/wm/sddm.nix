{ pkgs, ... }:
{
  environment.systemPackages = [
    (pkgs.catppuccin-sddm.override {
      flavor = "macchiato";
      # font = "JetBrainsMono";
      fontSize = "14";
      background = "";
      loginBackground = false;
    })
  ];

  services.displayManager = {
    defaultSession = "hyprland";
    sddm = {
      enable = true;
      package = pkgs.kdePackages.sddm;
      theme = "catppuccin-macchiato";
      wayland = {
        enable = true;
      };
      settings = { };
    };
  };
}
