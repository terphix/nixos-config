{ customLib, ... }:
{
  imports = (customLib.scanPaths ./.);
}