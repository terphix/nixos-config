{ pkgs, ... }:
{
  services.thermald = {
    enable = true;
    package = pkgs.thermald;
  };

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      vpl-gpu-rt
    ];
  };
}
