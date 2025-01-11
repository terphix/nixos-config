{
  pkgs,
  userConfig,
  ...
}:
let
  inherit (userConfig) wallpapersPath;
in
{
  programs.hyprlock = {
    enable = true;
    package = pkgs.hyprlock;
    settings = {
      general = {
        disable_loading_bar = true;
        grace = 10;
        hide_cursor = true;
        no_fade_in = false;
        no_fade_out = false;
      };
      background = [
        {
          path = "${wallpapersPath}/Lowpoly_Street.png";
        }
      ];
      input-field = [
        {
          # Main
          monitor = "";
          size = "300, 60";
          position = "0, -80";

          # Shape
          rounding = -1;
          shadow_passes = 2;
          outline_thickness = 5;
          fade_on_empty = false;

          inner_color = "rgb(8caaee)";
          outer_color = "rgb(303446)";

          # Dots
          dots_center = true;
          dots_size = 0.33;

          # Text
          font_color = "rgb(202, 211, 245)";
          font_family = "JetBrainsMono Nerd Font";

          placeholder_text = "";
          fail_text = "";
        }
      ];
    };
  };
}
