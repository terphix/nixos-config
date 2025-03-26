{ pkgs, ... }:
let
  catppuccin-grub = (
    pkgs.catppuccin-grub.override {
      flavor = "macchiato";
    }
  );
in
{
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "loglevel=3"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
    ];
    consoleLogLevel = 0;
    initrd.verbose = false;
    loader = {
      timeout = 60;
      efi.canTouchEfiVariables = true;
      systemd-boot = {
        enable = true;
      };
      grub = {
        enable = false;
        efiSupport = true;
        efiInstallAsRemovable = true;
        useOSProber = true;
        copyKernels = true;
        devices = [ "nodev" ];
        splashMode = "normal";
        splashImage = null;
        extraEntries = ''
          					menuentry "Reboot" {
          						reboot
          					}
          					menuentry "Shutoff" {
          						halt
          					}
          				'';
        theme = "${catppuccin-grub}";
      };
    };
  };
}
