{ config, pkgs, ... }:
{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    plugins = with pkgs; [
      rofi-pass-wayland
      rofi-emoji-wayland
    ];
    extraConfig = {
      # Main settings
      terminal = "kitty";
      font = "JetBrainsMono Nerd Font 14";

      location = 0;
      show-icons = false;
      sidebar-mode = true;
      hide-scrollbar = false;
      disable-history = false;

      # Custom
      modi = "drun,window";
      drun-display-format = "{icon} {name}";

      display-run = "   Run ";
      display-drun = "   Apps ";
      display-window = " 󰕰  Window";
      display-Network = " 󰤨  Network";
    };
  };

  programs.rofi.theme =
    let
      inherit (config.lib.formats.rasi) mkLiteral;
    in
    {
      "*" = {
        bg-col = mkLiteral "#24273a";
        bg-col-light = mkLiteral "#24273a";
        border-col = mkLiteral "#24273a";
        selected-col = mkLiteral "#24273a";
        blue = mkLiteral "#8aadf4";
        fg-col = mkLiteral "#cad3f5";
        fg-col2 = mkLiteral "#ed8796";
        grey = mkLiteral "#6e738d";
        width = 600;
        font = "JetBrainsMono Nerd Font 14";
      };

      "element-text, element-icon , mode-switcher" = {
        background-color = mkLiteral "inherit";
        text-color = mkLiteral "inherit";
      };

      "window" = {
        height = mkLiteral "360px";
        border = mkLiteral "3px";
        border-color = mkLiteral "@border-col";
        background-color = mkLiteral "@bg-col";
      };

      "mainbox" = {
        background-color = mkLiteral "@bg-col";
      };

      "inputbar" = {
        children = map mkLiteral [
          "prompt"
          "entry"
        ];
        background-color = mkLiteral "@bg-col";
        border-radius = mkLiteral "5px";
        padding = mkLiteral "2px";
      };

      "prompt" = {
        background-color = mkLiteral "@blue";
        padding = mkLiteral "6px";
        text-color = mkLiteral "@bg-col";
        border-radius = mkLiteral "3px";
        margin = mkLiteral "20px 0px 0px 20px";
      };

      "textbox-prompt-colon" = {
        expand = false;
        str = ":";
      };

      "entry" = {
        padding = mkLiteral "6px";
        margin = mkLiteral "20px 0px 0px 10px";
        text-color = mkLiteral "@fg-col";
        background-color = mkLiteral "@bg-col";
      };

      "listview" = {
        border = mkLiteral "0px 0px 0px";
        padding = mkLiteral "6px 0px 0px";
        margin = mkLiteral "10px 0px 0px 20px";
        columns = 2;
        lines = 5;
        background-color = mkLiteral "@bg-col";
      };

      "element" = {
        padding = mkLiteral "5px";
        background-color = mkLiteral "@bg-col";
        text-color = mkLiteral "@fg-col";
      };

      "element-icon" = {
        size = mkLiteral "25px";
      };

      "element selected" = {
        background-color = mkLiteral "@selected-col";
        text-color = mkLiteral "@fg-col2";
      };

      "mode-switcher" = {
        spacing = 0;
      };

      "button" = {
        padding = mkLiteral "10px";
        background-color = mkLiteral "@bg-col-light";
        text-color = mkLiteral "@grey";
        vertical-align = mkLiteral "0.5";
        horizontal-align = mkLiteral "0.5";
      };

      "button selected" = {
        background-color = mkLiteral "@bg-col";
        text-color = mkLiteral "@blue";
      };

      "message" = {
        background-color = mkLiteral "@bg-col-light";
        margin = mkLiteral "2px";
        padding = mkLiteral "2px";
        border-radius = mkLiteral "5px";
      };

      "textbox" = {
        padding = mkLiteral "6px";
        margin = mkLiteral "20px 0px 0px 20px";
        text-color = mkLiteral "@blue";
        background-color = mkLiteral "@bg-col-light";
      };
    };
}
