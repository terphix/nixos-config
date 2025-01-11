{
  wayland.windowManager.hyprland.settings = {
    # General settings
    general = {
      # Gaps and border
      gaps_in = 3;
      gaps_out = 5;
      border_size = 3;
      no_border_on_floating = false;

      # Border colors
      "col.active_border" = "rgb(8caaee)";
      "col.inactive_border" = "rgb(303446)";

      # Layout
      layout = "dwindle";
    };

    misc = {
      disable_hyprland_logo = true; # :(
      disable_splash_rendering = true;
      mouse_move_enables_dpms = true;

      vfr = true;
      vrr = 0;

      animate_manual_resizes = true;
      mouse_move_focuses_monitor = true;

      enable_swallow = true;
      swallow_regex = "^(wezterm)$";
    };

    # Windows decoration
    decoration = {
      rounding = 10;

      # Opacity settings
      active_opacity = 1.0;
      inactive_opacity = 1.0;

      # Blur
      blur = {
        size = 6;
        passes = 3;
        new_optimizations = true;
        xray = true;
        ignore_opacity = true;
      };

      # Shadows
      #drop_shadow = false;
      #shadow_ignore_window = true;
      #shadow_offset = "1 2";
      #shadow_range = 10;
      #shadow_render_power = 5;
      #"col.shadow" = "0x66404040";

      # blurls = "waybar";
      # blurls = "lockscreen";
    };

    # Windows animations
    animations = {
      enabled = true;
      bezier = [
        "wind, 0.05, 0.9, 0.1, 1.05"
        "winIn, 0.1, 1.1, 0.1, 1.1"
        "winOut, 0.3, -0.3, 0, 1"
        "liner, 1, 1, 1, 1"
      ];
      animation = [
        "windows, 1, 6, wind, slide"
        "windowsIn, 1, 6, winIn, slide"
        "windowsOut, 1, 5, winOut, slide"
        "windowsMove, 1, 5, wind, slide"
        "border, 1, 1, liner"
        "borderangle, 1, 30, liner, loop"
        "fade, 1, 10, default"
        "workspaces, 1, 5, wind"
      ];
    };

    # dwindle = {
    #     no_gaps_when_only = false;
    #    pseudotile = true;
    #     preserve_split = true;
    # };

    master = {
      new_status = "master";
    };
  };
}
