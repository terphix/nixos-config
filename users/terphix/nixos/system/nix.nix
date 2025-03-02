{ pkgs, ... }:
{
  nix = {
    package = pkgs.nix;
    optimise.automatic = true;
    settings = {
      warn-dirty = false;
      sandbox = true;
      max-jobs = "auto";
      cores = 0;
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];

      substituters = [
        "https://hyprland.cachix.org"
        "https://helix.cachix.org"
      ];

      trusted-public-keys = [
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
        "helix.cachix.org-1:ejp9KQpR1FBI2onstMQ34yogDm4OgU2ru6lIwPvuCVs="
      ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };
}
