{ pkgs, ... }:
{
  qt = {
    enable = true;
    platformTheme.name = "kvantum";
    style.name = "kvantum";
  };

  catppuccin.kvantum = {
    enable = true;
    apply = true;
    flavor = "macchiato";
    accent = "blue";
  };
}