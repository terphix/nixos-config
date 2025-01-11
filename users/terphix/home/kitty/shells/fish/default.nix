{
  pkgs,
  customLib,
  ...
}:
{
  imports = (customLib.scanPaths ./.);

  programs.fish = {
    enable = true;
    package = pkgs.fish;
  };
}
