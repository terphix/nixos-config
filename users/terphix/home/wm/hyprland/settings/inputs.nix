{ userConfig, ... }:
let
  inherit (userConfig.paths) screenshots config;
in
{
  wayland.windowManager.hyprland.settings = {
    input = {
      kb_layout = "us, ru";
      kb_variant = "lang";
      kb_options = "grp:caps_toggle";

      repeat_rate = 50;
      repeat_delay = 230;

      follow_mouse = 1;
      sensitivity = 0;

      touchpad = {
        natural_scroll = false;
        disable_while_typing = false;
        tap-to-click = true;
      };
    };

    gestures = {
      workspace_swipe = true;
      workspace_swipe_fingers = 3;
      workspace_swipe_invert = false;
      workspace_swipe_distance = 200;
      workspace_swipe_forever = true;
    };

    bind =
      [
        ############
        ### Apps ###
        ############
        # Standart
        "$mainMod, A, exec, $MENU"
        "$mainMod, E, exec, $FILE_BROWSER"
        "$mainMod, Escape, exec, $TOP"

        # Develop
        "$mainMod, RETURN, exec, $TERM"
        "$mainMod, C, exec, $CODE_EDITOR"
        "$mainMod SHIFT, C, exec, $CODE_EDITOR ${config}"

        # Webs
        "$mainMod, B, exec, $BROWSER"
        "$mainMod, Y, exec, $YOUTUBE_CLIENT"
        "$mainMod, D, exec, discord"

        ################
        ### Hardware ###
        ################
        # Screenshots
        '', PRINT, exec, hyprshot -m "region" -o ${screenshots}''
        ''$mainMod, PRINT, exec, hyprshot -m "output" -o ${screenshots}''

        # Sound
        ", XF86AudioMicMute, exec, pamixer --default-source -t"
        ", XF86AudioMute, exec, pamixer -t"
        ", XF86AudioLowerVolume, exec, pamixer -d 10"
        ", XF86AudioRaiseVolume, exec, pamixer -i 10"

        # Screen
        ", XF86MonBrightnessDown, exec, brightnessctl s 10%-"
        ", XF86MonBrightnessUp, exec, brightnessctl s +10%"

        ################
        ### Hyprland ###
        ################
        "$mainMod SHIFT CTRL, Escape, exit"

        # Pick color
        "$mainMod SHIFT, P, exec, hyprpicker -a"

        # Lock screen
        "$mainMod, L, exec, hyprlock -q"

        ###############
        ### Windows ###
        ###############
        # Change window mode
        "$mainMod, Q, killactive"
        "$mainMod SHIFT, F, fullscreen"
        "$mainMod, P, pin"
        "$mainMod, F, togglefloating"
        "$mainMod, J, togglesplit"

        # Move focus
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"

        # Move windows
        "$mainMod SHIFT, left, swapwindow, l"
        "$mainMod SHIFT, right, swapwindow, r"
        "$mainMod SHIFT, up, swapwindow, u"
        "$mainMod SHIFT, down, swapwindow, d"

        # Resize windows
        "$mainMod CTRL, left, resizeactive, -60 0"
        "$mainMod CTRL, right, resizeactive, 60 0"
        "$mainMod CTRL, up, resizeactive, 0 -60"
        "$mainMod CTRL, down, resizeactive, 0 60"

        ###################
        ### Workspaces ####
        ###################
        # Move using mouse
        "bind = $mainMod, mouse_down, workspace, e+1"
        "bind = $mainMod, mouse_up, workspace, e-1"

        # Move using keyboard
        "bind = $mainMod SHIFT, mouse_down, movetoworkspace, e+1"
        "bind = $mainMod SHIFT, mouse_up, movetoworkspace, e-1"

        # Special workspace
        "bind = $mainMod, S, togglespecialworkspace, magic"
        "bind = $mainMod SHIFT, S, movetoworkspace, special:magic"
      ]

      # Change workspace using numbers
      ++ (builtins.concatLists (
        builtins.genList (
          x:
          let
            ws =
              let
                c = (x + 1) / 10;
              in
              builtins.toString (x + 1 - (c * 10));
          in
          [
            "$mainMod, ${ws}, workspace, ${toString (x + 1)}"
            "$mainMod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
          ]
        ) 10
      ));

    bindm = [
      "$mainMod, mouse:272, movewindow"
      "$mainMod, mouse:273, resizewindow"
    ];
  };
}
