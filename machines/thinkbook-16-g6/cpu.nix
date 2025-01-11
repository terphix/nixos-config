{
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    inputs.nixos-hardware.nixosModules.common-cpu-intel
  ];

  services.thermald = {
    enable = true;
    package = pkgs.thermald;
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
}
