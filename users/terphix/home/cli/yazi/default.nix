{ pkgs, ... }:
{
  programs.yazi = {
    enable = true;
    package = pkgs.yazi;
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
        play = [
          {
            run = ''mpv --fs "$@"'';
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
