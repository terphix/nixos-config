{
  pkgs,
  inputs,
  ...
}:
{
  imports =
    [ ./profile ]
    ++ [
      inputs.arkenfox.hmModules.arkenfox
    ];

  programs.firefox = {
    enable = true;
    package = pkgs.firefox;
    arkenfox = {
      enable = true;
      version = "135.0";
    };
    languagePacks = [
      "en-US"
      "ru"
    ];
  };
}
