{ customLib, ... }:
{
  imports = (customLib.scanPaths ./.);
}
