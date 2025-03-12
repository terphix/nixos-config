{
  lib,
  userConfig,
  ...
}:
let
  inherit (userConfig.paths) downloads;
in
{
  programs.firefox.profiles.default.arkenfox = {
    enable = true;

    "0000".enable = false;

    "0100" = {
      enable = true;
      "0103"."browser.startup.homepage".value = "about:blank";
    };

    "0200".enable = true;
    "0300".enable = true;
    "0400".enable = true;
    "0600".enable = true;

    "0700" = {
      enable = true;
      "0710"."network.trr.mode" = {
        enable = true;
        value = 5;
      };
    };

    "0800".enable = true;
    "0900".enable = true;

    "1000" = {
      enable = true;
      "1001".enable = false;
    };

    "1200".enable = true;
    "1600".enable = true;
    "1700".enable = true;
    "2000".enable = true;
    "2400".enable = true;

    "2600" = {
      enable = true;
      "2615"."permissions.default.shortcuts".enable = true;
    };

    "2700".enable = true;

    "2800" = {
      enable = true;
      "2811" = {
        "privacy.clearOnShutdown_v2.historyFormDataAndDownloads".value = false;
      };
      "2820"."privacy.clearSiteData.historyFormDataAndDownloads".value = false;
      "2830"."privacy.clearHistory.historyFormDataAndDownloads".value = false;
    };

    "4500" = {
      enable = true;
      "4502".enable = false;
      "4504".enable = false;
    };

    "5000" = {
      enable = true;
      "5003"."signon.rememberSignons".enable = true;
      "5010"."browser.urlbar.suggest.topsites".enable = false;
      "5017" = {
        "extensions.formautofill.addresses.enabled".enable = true;
        "extensions.formautofill.creditCards.enabled".enable = true;
      };
      "5019"."browser.pagethumbnails.capturing_disabled".enable = true;
    };

    "5500" = {
      enable = true;
      "5508" = {
        "media.eme.enabled".enable = true;
        "browser.eme.ui.enabled".enable = true;
      };
    };

    "6000".enable = true;
    "7000".enable = true;
    "8000".enable = true;
    "9000".enable = true;
  };

  programs.firefox.profiles.default.settings = {
    "browser.startup.page" = lib.mkForce 3;
    "app.update.auto" = false;
    "browser.backspace_action" = 0;
    "browser.disableResetPrompt" = true;
    "browser.download.autohideButton" = false;
    "browser.aboutConfig.showWarning" = false;
    "browser.newtabpage.introShown" = true;
    "browser.newtabpage.pinned" = "";
    "browser.onboarding.enabled" = false;
    # "browser.open.lastDir" = "";
    "browser.protections_panel.infoMessage.seen" = true;
    "browser.region.update.region" = "US";
    "browser.search.region" = "US";
    "browser.search.separatePrivateDefault" = lib.mkForce false;
    "browser.search.separatePrivateDefault.ui.enabled" = lib.mkForce false;
    "browser.search.update" = false;
    "browser.shell.checkDefaultBrowser" = false;
    "browser.tabs.closeWindowWithLastTab" = true;
    "browser.tabs.firefox-view" = false;
    "browser.tabs.firefox-view-next" = false;
    "browser.tabs.inTitlebar" = 0;
    "browser.tabs.tabmanager.enabled" = false;
    "browser.tabs.warnOnClose" = false;
    "browser.tabs.warnOnCloseOtherTabs" = false;
    "browser.tabs.warnOnOpen" = false;
    "browser.theme.dark-private-windows" = false;
    "browser.toolbars.bookmarks.visibility" = "always";
    "browser.translations.enable" = false;
    "browser.uidensity" = 0;

    "browser.urlbar.suggest.calculator" = true;
    "browser.urlbar.suggest.topsites" = false;
    "browser.urlbar.suggest.trending" = false;
    "browser.urlbar.suggest.weather" = false;
    "browser.urlbar.suggest.yelp" = false;

    "browser.urlbar.decodeURLsOnCopy" = true;
    "browser.urlbar.suggest.addons" = false;
    "browser.urlbar.suggest.bookmark" = true;
    "browser.urlbar.suggest.engines" = false;
    "browser.urlbar.suggest.history" = true;
    "browser.urlbar.suggest.openpage" = true;
    "browser.warnOnQuitShortcut" = false;

    "devtools.everOpened" = true;
    "doh-rollout.home-region" = "US";
    "extensions.pocket.enabled" = false;
    "extensions.update.autoUpdateDefault" = false;
    "extensions.update.enabled" = false;
    "full-screen-api.warning.delay" = 0;
    "full-screen-api.warning.timeout" = 0;
    "general.autoScroll" = true;
    "general.smoothScroll" = true;
    "identity.fxaccounts.enabled" = false;
    "media.autoplay.blocking_policy" = 2;
    "media.autoplay.default" = 5;
    "media.hardwaremediakeys.enabled" = false;
    "media.videocontrols.picture-in-picture.video-toggle.enabled" = false;
    "reader.parse-on-load.enabled" = false;
    "svg.context-properties.content.enabled" = true;
    "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
    "widget.gtk.rounded-bottom-corners.enabled" = true;

    "extensions.autoDisableScopes" = 0;
    "extensions.activeThemeID" = lib.mkForce "{d49033ac-8969-488c-afb0-5cdb73957f41}";

    "browser.uiCustomization.state" =
      ''{"placements":{"widget-overflow-fixed-list":[],"unified-extensions-area":["_74145f27-f039-47ce-a470-a662b129930a_-browser-action"],"nav-bar":["back-button","forward-button","vertical-spacer","downloads-button","urlbar-container","save-to-pocket-button","fxa-toolbar-menu-button","ublock0_raymondhill_net-browser-action","sponsorblocker_ajay_app-browser-action","unified-extensions-button"],"toolbar-menubar":["menubar-items"],"TabsToolbar":["firefox-view-button","tabbrowser-tabs"],"vertical-tabs":[],"PersonalToolbar":["personal-bookmarks"]},"seen":["_74145f27-f039-47ce-a470-a662b129930a_-browser-action","ublock0_raymondhill_net-browser-action","sponsorblocker_ajay_app-browser-action","developer-button"],"dirtyAreaCache":["unified-extensions-area","nav-bar","vertical-tabs","toolbar-menubar","TabsToolbar","PersonalToolbar"],"currentVersion":21,"newElementCount":3}'';
    "browser.newtabpage.activity-stream.showWeather" = false;
    "browser.newtabpage.activity-stream.feeds.topsites" = false;
    "browser.newtabpage.activity-stream.feeds.section.topstories" = false;

    "browser.download.dir" = downloads;
    "browser.download.folderList" = 2;

    "network.proxy.no_proxies_on" = ".ru, 3.shkolkovo.online";

    "widget.use-xdg-desktop-portal.file-picker" = 0;
  };
}
