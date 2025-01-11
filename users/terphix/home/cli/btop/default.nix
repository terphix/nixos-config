{ pkgs, ... }:
{
  programs.btop = {
    enable = true;
    package = pkgs.btop;
    settings = {
      vim_keys = true;
      update_ms = 500;
      disk_filter = "";
      net_iface = "wg0";
      mem_graphs = false;
    };
  };

  catppuccin.btop = {
    enable = true;
    flavor = "macchiato";
  };
}
