{ pkgs, lib, ... }:
{
  programs.firefox.profiles.default.search = {
    force = true;
    default = lib.mkForce "DuckDuckGo";
    order = [
      "DuckDuckGo"
      "Brave search"
    ];

    engines =
      let
        getIcon = url: hash: pkgs.fetchurl { inherit url hash; };
      in
      {
        "Amazon.com".metaData.hidden = true;
        "Bing".metaData.hidden = true;
        "eBay".metaData.hidden = true;
        "Google".metaData.hidden = true;
        "Wikipedia (en)".metaData.hidden = true;

        "crates.io" = {
          urls = [ { template = "https://crates.io/search?q={searchTerms}"; } ];
          icon = getIcon "https://crates.io/favicon.ico" "sha256-upooA/+m5KMUD1t4WFY3EOmytdpUFgNqUj12Auta1mM=";
          definedAliases = [ "@crates" ];
        };

        "Docker Hub" = {
          urls = [ { template = "https://hub.docker.com/search?q={searchTerms}"; } ];
          icon = getIcon "https://www.docker.com/app/uploads/2024/02/cropped-docker-logo-favicon-32x32.png" "sha256-qeCP5Iw2EIXTNI792B1axYMKhpWurZthbflq+I3dqsc=";
          definedAliases = [
            "@docker"
          ];
        };

        "GitHub" = {
          urls = [ { template = "https://github.com/search?q={searchTerms}"; } ];
          icon = getIcon "https://github.githubassets.com/favicons/favicon.svg" "sha256-apV3zU9/prdb3hAlr4W5ROndE4g3O1XMum6fgKwurmA=";
          definedAliases = [
            "@github"
            "@gh"
          ];
        };

        "NixOS Packages" = {
          urls = [ { template = "https://search.nixos.org/packages?channel=unstable&query={searchTerms}"; } ];
          icon = getIcon "https://nixos.org/favicon.png" "sha256-17/8nOSLmkDyABW9LdHhTqPykqYDtCFuqFeGTT4sqLo=";
          definedAliases = [
            "@nixpkgs"
            "@np"
          ];
        };

        "Home Manager Options" = {
          urls = [
            { template = "https://home-manager-options.extranix.com/?query={searchTerms}&release=master"; }
          ];
          icon = getIcon "https://nixos.org/favicon.png" "sha256-17/8nOSLmkDyABW9LdHhTqPykqYDtCFuqFeGTT4sqLo=";
          definedAliases = [
            "@hm"
          ];
        };
      };
  };
}
