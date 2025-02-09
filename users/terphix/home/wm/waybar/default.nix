{ pkgs, ... }:
{
  programs.waybar = {
    enable = true;
    package = pkgs.waybar;
    style = ''
      * {
        font-family: "JetBrainsMono Nerd Font";
        font-weight: bold;
        font-size: 14px;
        min-height: 0;
      }

      #waybar {
        background: transparent;
        color: @text;
        margin: 5px 5px;
      }

      #workspaces {
        border-radius: 1rem;
        margin: 5px;
        background-color: @surface0;
        margin-left: 1rem;
      }

      #workspaces button {
        color: @blue;
        border-radius: 1rem;
        padding: 0.4rem;
      }

      #workspaces button.active {
        color: @green;
        border-radius: 1rem;
      }

      #workspaces button:focus,
      #workspaces button:hover {
        box-shadow: none; /* Remove predefined box-shadow */
        text-shadow: none; /* Remove predefined text-shadow */
        background: none; /* Remove predefined background color (white) */
        transition: none; /* Disable predefined animations */
        border-color: transparent;
        padding: 0.4rem;
      }

      #tray,
      #clock,
      #cpu,
      #battery,
      #memory,
      #custom-music,
      #custom-power {
        background-color: @surface0;
        padding: 0.5rem 1rem;
        margin: 5px 0;
      }

      #clock {
        color: @blue;
        border-radius: 1rem 0px 0px 1rem;
      }

      #tray > .passive {
        -gtk-icon-effect: dim;
      }
      #tray > .needs-attention {
        -gtk-icon-effect: highlight;
      }

      #custom-music {
        color: @mauve;
        border-radius: 1rem;
      }

      #cpu {
        color: @green;
      }

      #memory {
        color: @green;
      }

      #battery {
        color: @green;
        border-radius: 0px 1rem 1rem 0px;
        margin-right: 1rem;
      }

      #battery.charging {
        color: @green;
      }

      #battery.warning:not(.charging) {
        color: @red;
      }

      #custom-power {
        margin-right: 1rem;
        border-radius: 1rem;
        color: @red;
      }

      #tray {
        margin-right: 1rem;
        border-radius: 1rem;
      }
    '';

    settings = [
      {
        height = 44;
        layer = "top";
        position = "top";

        modules-left = [
          "hyprland/workspaces"
        ];
        modules-center = [
          "custom/music"
        ];
        modules-right = [
          "tray"
          "clock"
          "memory"
          "cpu"
          "battery"
          "custom/power"
        ];

        "hyprland/workspaces" = {
          disable-scroll = true;
          sort-by-name = true;
          format = " {icon} ";
          format-icons = {
            default = "";
          };
          tooltip = false;
          active-only = false;
          persistent-workspaces = {
            "*" = 10;
          };
        };

        "custom/music" = {
          format = "  {}";
          escape = true;
          interval = 5;
          tooltip = false;
          exec = "${pkgs.playerctl}/bin/playerctl metadata --format='{{ title }}'";
          on-click = "${pkgs.playerctl}/bin/playerctl play-pause";
          max-length = 40;
        };

        "custom/power" = {
          tooltip = false;
          on-click = "shutdown now";
          format = " ⏻ ";
        };

        clock = {
          timezone = "Asia/Novosibirsk";
          format = " {:%H:%M}";
          format-alt = " {:%Y, %d %B, %A}";
          tooltip = false;
        };

        battery = {
          states = {
            warning = 30;
            critical = 15;
          };
          bat = "BAT0";
          interval = 60;
          full-at = 80;
          tooltip = false;
          format = "{icon} {capacity}%";
          format-alt = "{icon} {time}";
          format-full = "{icon} Full";
          format-time = "{H}h {M}min";
          format-charging = " {capacity}%";
          format-plugged = "󱘖 {capacity}%";
          format-icons = [
            "󰂎"
            "󰁺"
            "󰁻"
            "󰁼"
            "󰁽"
            "󰁾"
            "󰁿"
            "󰂀"
            "󰂁"
            "󰂂"
            "󰁹"
          ];
        };

        memory = {
          interval = 10;
          format = "{used:0.1f}G 󰾆";
          format-alt = "{percentage}% 󰾆";
          tooltip = false;
        };

        cpu = {
          format = "{usage}% 󰍛";
          interval = 1;
          min-length = 5;
          format-alt-click = "click";
          format-alt = "{icon0}{icon1}{icon2}{icon3} {usage:>2}% 󰍛";
          format-icons = [
            "▁"
            "▂"
            "▃"
            "▄"
            "▅"
            "▆"
            "▇"
            "█"
          ];
          tooltip = false;
        };

        tray = {
          icon-size = 18;
          spacing = 10;
        };
      }
    ];
  };

  catppuccin.waybar = {
    enable = true;
    flavor = "macchiato";
    mode = "prependImport";
  };
}
