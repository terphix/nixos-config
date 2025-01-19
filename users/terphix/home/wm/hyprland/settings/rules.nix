{
  wayland.windowManager.hyprland.settings.windowrulev2 = [
    #############
    ### Float ###
    #############
    "float, class:^(kitty)$, title:^(kitty)$"
    "float, class:^(kitty)$, title:^(btop)$"
    "float, title:^(Picture in picture)$"

    ################
    ### Position ###
    ################
    "center, class:^(kitty)$, title:^(kitty)$"
    "center, class:^(kitty)$, title:^(btop)$"

    "move 56% 2%, title:^(Picture in picture)$"

    #################
    ### Workspace ###
    #################
    "workspace 4, class:^(brave-browser)$"
    "workspace 4, class:^(FreeTube)$"
    "workspace 5, class:^(kitty)$, title:^(helix)$"
    "workspace 6, class:^(kitty)$, title:^(yazi)$"
    "workspace 9, class:^(discord)$"

    "workspace 10 silent, class:^([Nn]ekoray)$"

    ##############
    ### Resize ###
    ##############
    "size 75% 75%, class:^(kitty)$, title:^(kitty)$"
    "size 75% 75%, class:^(kitty)$, title:^(btop)$"
    "size 688 387, title:^(Picture in picture)$"

    ###########
    ### Pin ###
    ###########
    "pin, title:^(Picture in picture)$"

    #############
    ### Extra ###
    #############
    "keepaspectratio, title:^(Picture in picture)$"
  ];
}
