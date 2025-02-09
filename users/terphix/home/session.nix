{ userConfig, ... }:
let
  inherit (userConfig.paths) config;
in
{
  home.sessionVariables = {
    inherit config;
    GDK_SCALE = "2";
    GTK_USE_PORTAL = "1";
  };
}
