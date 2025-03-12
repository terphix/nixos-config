{ pkgs, ... }:
{
  programs.helix.languages.language = [
    ###########
    ### Nix ###
    ###########
    {
      name = "nix";
      file-types = [ "nix" ];
      auto-format = true;

      indent = {
        tab-width = 2;
        unit = "  ";
      };

      formatter.command = "${pkgs.stable.nixfmt-rfc-style}/bin/nixfmt";
      language-servers = [ "nixd" ];
    }

    ############
    ### Rust ###
    ############
    {
      name = "rust";
      file-types = [ "rs" ];
      auto-format = true;

      indent = {
        tab-width = 4;
        unit = "    ";
      };

      formatter.command = "${pkgs.rustfmt}/bin/rustfmt";
      language-servers = [ "rust-analyzer" ];
    }

    ##############
    ### Python ###
    ##############
    {
      name = "python";
      file-types = [ "py" ];
      auto-format = true;

      indent = {
        tab-width = 4;
        unit = "    ";
      };

      language-servers = [ "ruff" ];
      formatter = {
        command = "${pkgs.black}/bin/black";
        args = [
          "--quiet"
          "--line-length=90"
          "-"
        ];
      };
    }
  ];
}
