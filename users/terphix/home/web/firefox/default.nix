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
    package = pkgs.stable.firefox;
    arkenfox.enable = true;
    languagePacks = [
      "en-US"
      "ru"
    ];
  };
}
