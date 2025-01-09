{ pkgs, ... }:
{
  # FIXME: Add more settings
  nix = {
    package = pkgs.nix;
    optimise.automatic = true;
    settings = {
      warn-dirty = false;
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };
}
