{ pkgs, ... }:
{
  programs.fish = {
    plugins = [
      {
        name = "sponge";
        src = pkgs.fishPlugins.sponge.src;
      }

      {
        name = "autopair";
        src = pkgs.fishPlugins.autopair.src;
      }
    ];

    shellInit = "set sponge_delay 5";
  };
}
