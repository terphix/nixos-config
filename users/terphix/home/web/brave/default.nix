{ pkgs, ... }:
{
  programs.chromium = {
    enable = true;
    package = pkgs.stable.brave;

    extensions = [
      { id = "cjpalhdlnbpafiamejdnhcphjbkeiagm"; } # Ublock Orifin
    ];
    commandLineArgs = [
      "--disable-features=WebRtcAllowInputVolumeAdjustment"
      "--restore-last-session"
      "--no-default-browser-check"
    ];
  };
}
