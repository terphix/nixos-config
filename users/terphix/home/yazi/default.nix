{ pkgs, ... }:
{
  programs.yazi = {
    enable = true;
    package = pkgs.unstable.yazi;
    enableFishIntegration = true;
    settings = {
      log.enable = false;
      manager = {
        show_hidden = false;
        sort_by = "alphabetical";
        sort_dir_first = true;
      };
      opener = {
        edit = [
          {
            run = ''hx "$@"'';
            block = true;
          }
        ];
      };
    };
  };
  catppuccin.yazi = {
    enable = true;
    flavor = "macchiato";
    accent = "blue";
  };
}
