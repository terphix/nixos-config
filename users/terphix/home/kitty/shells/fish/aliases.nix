{ userConfig, ... }:
let
  inherit (userConfig) configDir;
in
{
  programs.fish.shellAliases = {
    shell = "nix-shell --command fish ./Shell";
    rb = "sudo nixos-rebuild switch --flake ${configDir}";

    ls = "lsd";
    ff = "fastfetch";
  };
}
