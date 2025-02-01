{
  inputs,
  customLib,
  userConfig,
  ...
}:
let
  helixPackages = inputs.helix.packages.${userConfig.system};
in
{
  imports = (customLib.scanPaths ./.);

  programs.helix = {
    enable = true;
    defaultEditor = true;
    package = helixPackages.helix;
  };

  catppuccin.helix = {
    enable = true;
    flavor = "macchiato";
  };
}
