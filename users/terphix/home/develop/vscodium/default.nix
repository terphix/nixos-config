{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    mutableExtensionsDir = false;
    profiles.default = {
      enableUpdateCheck = false;
      enableExtensionUpdateCheck = false;

      extensions = with pkgs.vscode-marketplace; [
        ### View
        catppuccin.catppuccin-vsc

        ## Nix
        bbenoist.nix
        jnoortheen.nix-ide
        kamadorueda.alejandra
        brettm12345.nixfmt-vscode
        arrterian.nix-env-selector
        jeff-hykin.better-nix-syntax

        ### Python
        ms-python.python
        ms-python.black-formatter

        ### Rust
        rust-lang.rust-analyzer
      ];

      userSettings = {
        ### Main Settings
        "files.autoSave" = "onFocusChange";
        "workbench.startupEditor" = "none";

        ### View Settings
        "workbench.colorTheme" = "Catppuccin Macchiato";
        "window.titleBarStyle" = "custom";
        "window.zoomLevel" = 1;

        "chat.commandCenter.enabled" = false;
        "workbench.layoutControl.enabled" = false;
        "workbench.navigationControl.enabled" = false;
        # "window.menuBarVisibility" = "compact";

        ### Font Settings
        "editor.fontFamily" = "'JetBrainsMono Nerd Font'";
        "editor.fontLigatures" = true;
        "editor.fontSize" = 16;
        "editor.minimap.sectionHeaderFontSize" = 16;
        "editor.suggestFontSize" = 16;

        ### Nix Settings
        "[nix]" = {
          "editor.defaultFormatter" = "brettm12345.nixfmt-vscode";
          "editor.formatOnPaste" = true;
          "editor.formatOnSave" = true;
          "editor.formatOnType" = false;
        };
        "nixfmt.path" = "${pkgs.nixfmt}/bin/nixfmt";

        ### Rust Settings
        "[rust]" = {
          "editor.defaultFormatter" = "rust-lang.rust-analyzer";
          "editor.formatOnSave" = true;
          "editor.formatOnPaste" = true;
          "editor.formatOnType" = false;
        };
      };
    };
  };
}
