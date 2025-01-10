{
  inputs,
  userConfig,
  pkgs,
  ...
}:
let
  # Unstable packages to sinc with Hyprland
  unstable = inputs.hyprland.inputs.nixpkgs.legacyPackages.${userConfig.system};
in
{
  services.thermald = {
    enable = true;
    package = pkgs.thermald;
  };

  hardware.graphics = {
    enable = true;
    package = unstable.mesa.drivers;

    extraPackages = with pkgs; [
      vpl-gpu-rt
    ];

    # For 32-bit
    enable32Bit = true;
    package32 = unstable.pkgsi686Linux.mesa.drivers;
  };
}
