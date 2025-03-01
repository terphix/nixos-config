{ customLib, ... }:
{
  imports = (customLib.scanPaths ./.);

  programs.firefox.profiles.default = {
    id = 0;
    isDefault = true;
  };
}
