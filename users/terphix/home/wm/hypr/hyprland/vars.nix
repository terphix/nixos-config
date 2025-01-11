{
  wayland.windowManager.hyprland.settings = {
    "$mainMod" = "SUPER";
    "$TERM" = "kitty";

    "$MENU" = "rofi -show drun";
    "$TOP" = "$TERM btop";
    "$FILES" = "kitty yazi";
    "$BROWSER" = "brave";

    exec-once = [
      "hyprctl setcursor 28"
      "systemctl --user start plasma-polkit-agent.service"
    ];
  };
}
