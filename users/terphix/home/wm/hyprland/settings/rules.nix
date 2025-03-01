{
  wayland.windowManager.hyprland.settings.windowrulev2 = [
    ############
    ### Tags ###
    ############
    "tag +browser, class:^(brave-browser)$"
    "tag +browser, class:^(firefox)$"

    "tag +webs, class:^(discord)$"
    "tag +webs, class:^(FreeTube)$"

    "tag +terminal, class:^(kitty)$, title:^(kitty)$"
    "tag +terminal, class:^(kitty)$, title:^(btop)$"

    "tag +file_browser, class:^(kitty)$, title:^(yazi)$"

    "tag +editor, class:^(kitty)$, title:^(helix)$"

    "tag +pic_in_pic, title:^(Picture in [Pp]icture)$"

    #############
    ### Float ###
    #############
    "float, tag:terminal*"
    "float, tag:pic_in_pic*"

    ################
    ### Position ###
    ################
    "center, tag:terminal*"

    "move 56% 2%, tag:pic_in_pic*"

    #################
    ### Workspace ###
    #################
    "workspace 1, tag:browser*"
    "workspace 2, tag:editor*"
    "workspace 3, tag:file_browser*"
    "workspace 9, tag:webs*"

    "workspace 10 silent, class:^([Nn]ekoray)$"

    ###############
    ### Opacity ###
    ###############

    ##############
    ### Resize ###
    ##############
    "size 75% 75%, tag:terminal*"
    "size 688 387, tag:pic-in-pic*"

    ###########
    ### Pin ###
    ###########
    "pin, tag:pic_in_pic*"

    #############
    ### Extra ###
    #############
    "keepaspectratio, tag:pic_in_pic*"
  ];
}
