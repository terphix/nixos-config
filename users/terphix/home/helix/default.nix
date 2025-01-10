{ pkgs, ... }:
{
  programs.helix = {
    enable = true;
    package = pkgs.helix;
    defaultEditor = true;
    settings = {
      editor = {
        scrolloff = 8;
        mouse = false;
        middle-click-paste = false;
        true-color = true;
        line-number = "relative";
        cursorline = true;
        idle-timeout = 200;
        lsp = {
          enable = true;
          display-messages = true;
          snippets = true;
        };
        cursor-shape = {
          normal = "block";
          insert = "bar";
          select = "underline";
        };
        file-picker = {
          hidden = false;
          git-ignore = false;
          git-global = true;
        };
        rulers = [
          80
        ];
      };
      keys.normal = {
        space.space = "file_picker";
        space.w = ":w";
        space.q = ":q";
      };
    };
    languages = {
      language = [
        {
          name = "nix";
          auto-format = true;
          formatter.command = "${pkgs.nixfmt-rfc-style}/bin/nixfmt";
          language-servers = [ "nixd" ];
          file-types = [ "nix" ];
        }
        {
          name = "rust";
          auto-format = true;
          formatter.command = "${pkgs.rust-analyzer}/bin/rust-analyzer";
          language-servers = [ "rust-analyzer" ];
        }
      ];
      language-server = {
        nixd = {
          command = "${pkgs.nixd}/bin/nixd";
        };
        rust-analyzer = {
          command = "${pkgs.rust-analyzer}/bin/rust-analyzer";
        };
      };
    };
    ignores = [
      "__pycache__/"
      ".git/"
      ".ruff_cache/"
    ];
  };

  catppuccin.helix = {
    enable = true;
    flavor = "macchiato";
  };
}
