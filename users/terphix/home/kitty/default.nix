{ pkgs, ... }:
{
  imports = [
    ./shells
    ./starship
  ];
  programs.kitty = {
    enable = true;
    package = pkgs.kitty;
    shellIntegration = {
      enableFishIntegration = true;
    };
    themeFile = "Catppuccin-Macchiato";
    settings = {
      shell = "fish";
      cursor_trail = 3;
      confirm_os_window_close = 0;
      enable_audio_bell = false;

      scrollback_lines = 10000;
      mouse_hide_wait = "-1.0";
    };
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 14;
    };
    keybindings = {
      "ctrl+=" = "increase_font_size";
      "ctrl+-" = "decrease_font_size";
    };
  };
}
