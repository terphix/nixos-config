{ userConfig, ... }:
let
  inherit (userConfig) configPath;
in
{
  programs.fish.shellAliases = {
    shell = "nix-shell --command fish ./Shell";
    rb = "sudo nixos-rebuild switch --flake ${configPath}";
    gc = "sudo nix-collect-garbage -d";
    shut = "shutdown now";

    ls = "lsd";
    ff = "fastfetch";
  };
}
