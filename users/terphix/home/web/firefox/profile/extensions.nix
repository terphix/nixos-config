{
  lib,
  pkgs,
  ...
}:
{
  programs.firefox.profiles.default.extensions = {
    packages =
      let
        ####
        ## This was done using the incredible addon generator[1]. All credit
        ## goes to Robert Helgesson.
        ##
        ## [1]: https://sr.ht/~rycee/mozilla-addons-to-nix/
        ####
        buildFirefoxXpiAddon = lib.makeOverridable (
          {
            stdenv ? pkgs.stdenv,
            fetchurl ? pkgs.fetchurl,
            pname,
            version,
            addonId,
            url,
            sha256,
            meta,
            ...
          }:
          stdenv.mkDerivation {
            name = "${pname}-${version}";
            src = fetchurl { inherit url sha256; };
            buildCommand = ''
              install -Dm644 "$src" "$out/share/mozilla/extensions/{ec8030f7-c20a-464f-9b0e-13a3a9e97384}/${addonId}.xpi"
            '';
            inherit meta;
          }
        );

        addons = import ../addons/addons.nix { inherit buildFirefoxXpiAddon lib; };
      in
      with addons;
      [
        catppuccin-macchiato-blue
        no-pdf-download
        ublock-origin
        clearurls
        brave-search
        sponsorblock
      ];
  };
}
