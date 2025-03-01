{ userConfig, ... }:
let
  inherit (userConfig.paths) config;
in
{
  programs.fish.shellAliases = {
    shell = "nix-shell --command fish ./Shell";
    rb = "sudo nixos-rebuild switch --flake ${config}";
    rb-diff = "sudo nixos-rebuild build --flake ${config} && nvd diff /run/current-system result && rm result";
    gc = "sudo nix-collect-garbage -d";
    shut = "shutdown now";

    ls = "lsd";
    ff = "fastfetch";
    udm = "udisksctl mount -b /dev/sda";
  };
}
