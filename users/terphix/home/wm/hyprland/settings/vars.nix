{
  wayland.windowManager.hyprland.settings = {
    "$mainMod" = "SUPER";
    "$TERM" = "kitty";
    "$MENU" = "rofi -show drun";
    "$NOTIFICATIONS" = "mako";
    "$BAR" = "waybar";

    "$TOP" = "kitty --title btop btop";
    "$FILE_BROWSER" = "kitty --title yazi yazi";

    "$CODE_EDITOR" = "kitty --title helix hx";

    "$BROWSER" = "firefox";
    "$YOUTUBE_CLIENT" = "freetube";

    exec-once = [
      "hyprctl setcursor 28"
      "$BAR"
      "$NOTIFICATIONS"
      "$BROWSER"
      "[workspace special:magic silent] $TERM"
    ];
  };
}
