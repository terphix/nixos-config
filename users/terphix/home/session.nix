{ userConfig, ... }:
let
  inherit (userConfig.paths) config;
in
{
  home.sessionVariables = {
    inherit config;
    GTK_USE_PORTAL = "1";
  };
}
