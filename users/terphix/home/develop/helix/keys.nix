{
  programs.helix.settings.keys.normal = {
    # Pickers and searchers
    space.space = "file_picker";

    space.f = "global_search";
    space.F = "no_op";
    space."/" = "no_op";

    space.e = "file_explorer_in_current_buffer_directory";
    space.E = "file_explorer";

    # Actions
    space.w = ":w";
    space.q = ":q";

    space.a = "code_action";
    space.r = "rename_symbol";

    # Copy paste
    space.y = "yank_main_selection_to_clipboard";
    space.Y = "no_op";

    space.p = "paste_clipboard_before";
    space.P = "paste_clipboard_after";
  };
}
