{ userConfig, ... }:
let
  inherit (userConfig) configPath;
in
{
  programs.fish.shellAliases = {
    shell = "nix-shell --command fish ./Shell";
    rb = "sudo nixos-rebuild switch --flake ${configPath}";

    ls = "lsd";
    ff = "fastfetch";
  };
}
