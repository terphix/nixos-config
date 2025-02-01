{ userConfig, ... }:
let
  inherit (userConfig) configPath;
in
{
  programs.fish.shellAliases = {
    shell = "nix-shell --command fish ./Shell";
    rb = "sudo nixos-rebuild switch --flake ${configPath}";
    rb-diff = "sudo nixos-rebuild boot --flake ${configPath} && nvd diff /run/booted-system /run/current-system";
    gc = "sudo nix-collect-garbage -d";
    shut = "shutdown now";

    ls = "lsd";
    ff = "fastfetch";
    udm = "udisksctl mount -b /dev/sda";
  };
}
