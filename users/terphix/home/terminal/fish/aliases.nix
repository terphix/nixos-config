{ userConfig, ... }:
let
  inherit (userConfig.paths) config;
in
{
  programs.fish.shellAliases = {
    shell = "nix-shell --command fish ./Shell";
    rb = "sudo nixos-rebuild switch --flake ${config}";
    rb-diff = "sudo nixos-rebuild boot --flake ${config} && nvd diff /run/booted-system /run/current-system";
    gc = "sudo nix-collect-garbage -d";
    shut = "shutdown now";

    ls = "lsd";
    ff = "fastfetch";
    udm = "udisksctl mount -b /dev/sda";
  };
}
