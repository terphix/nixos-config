{
  programs.helix.settings = {
    editor = {
      # Base
      auto-format = true;
      idle-timeout = 200;

      # Mouse
      mouse = false;
      scrolloff = 8;
      middle-click-paste = false;

      # UI
      true-color = true;
      line-number = "relative";
      rulers = [ 90 ];

      cursorline = true;
      cursor-shape = {
        normal = "block";
        insert = "bar";
        select = "underline";
      };

      # Soft wrapping lines
      soft-wrap = {
        enable = true;
        wrap-indicator = "";
        wrap-at-text-width = true;
      };

      # LSP
      lsp = {
        enable = true;
        display-messages = true;
        snippets = true;
      };

      # File Picker
      file-picker = {
        hidden = false;
        git-ignore = false;
        git-global = true;
      };
    };
  };
}
