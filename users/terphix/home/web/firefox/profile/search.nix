{ lib, ... }:
{
  programs.firefox.profiles.default.search = {
    force = true;
    default = lib.mkForce "DuckDuckGo";
    order = [
      "DuckDuckGo"
    ];

    engines = {
      "Amazon.com".metaData.hidden = true;
      "Bing".metaData.hidden = true;
      "eBay".metaData.hidden = true;
      "Google".metaData.hidden = true;
      "Wikipedia (en)".metaData.hidden = true;
      "Brave search".definedAliases = [
        "brave"
        "br"
      ];

      "crates.io" = {
        urls = [ { template = "https://crates.io/search?q={searchTerms}"; } ];
        definedAliases = [ "@crates" ];
      };

      "Docker Hub" = {
        urls = [ { template = "https://hub.docker.com/search?q={searchTerms}"; } ];
        definedAliases = [
          "@docker"
        ];
      };

      "GitHub" = {
        urls = [ { template = "https://github.com/search?q={searchTerms}"; } ];
        definedAliases = [
          "@github"
          "@gh"
        ];
      };

      "NixOS Packages" = {
        urls = [ { template = "https://search.nixos.org/packages?channel=unstable&query={searchTerms}"; } ];
        definedAliases = [
          "@nixpkgs"
          "@np"
        ];
      };

      "Home Manager Options" = {
        urls = [
          { template = "https://home-manager-options.extranix.com/?query={searchTerms}&release=master"; }
        ];
        definedAliases = [
          "@hm"
        ];
      };
    };
  };
}
