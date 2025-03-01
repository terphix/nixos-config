{
  buildFirefoxXpiAddon,
  lib,
}:
{
  "brave-search" = buildFirefoxXpiAddon {
    pname = "brave-search";
    version = "1.3.0";
    addonId = "BraveSearchExtension@io.Uvera";
    url = "https://addons.mozilla.org/firefox/downloads/file/4278495/brave_search-1.3.0.xpi";
    sha256 = "37c5c566423547ea44ec71771d03c98544e2d93fa0f211d5c0a54a782091a67a";
    meta = with lib; {
      homepage = "https://github.com/uvera/firefox-extension-brave-search";
      description = "Adds Brave search as a search engine.";
      license = licenses.mit;
      mozPermissions = [ ];
      platforms = platforms.all;
    };
  };
  "catppuccin-macchiato-blue" = buildFirefoxXpiAddon {
    pname = "catppuccin-macchiato-blue";
    version = "2.0";
    addonId = "{d49033ac-8969-488c-afb0-5cdb73957f41}";
    url = "https://addons.mozilla.org/firefox/downloads/file/3989615/catppuccin_macchiato_blue-2.0.xpi";
    sha256 = "56736a4c269afea948cff48fa01f1b61edfee60822f70dda6430d2d4a0a622ac";
    meta = with lib; {
      description = "🦊 Soothing pastel theme for Firefox (Official)";
      license = licenses.cc-by-30;
      mozPermissions = [ ];
      platforms = platforms.all;
    };
  };
  "clearurls" = buildFirefoxXpiAddon {
    pname = "clearurls";
    version = "1.27.3";
    addonId = "{74145f27-f039-47ce-a470-a662b129930a}";
    url = "https://addons.mozilla.org/firefox/downloads/file/4432106/clearurls-1.27.3.xpi";
    sha256 = "54926b6e4274d5935a5fc0daa6320f1d371e3d2f1a5877467ca3ab22a65c4f20";
    meta = with lib; {
      homepage = "https://clearurls.xyz/";
      description = "Removes tracking elements from URLs";
      license = licenses.lgpl3;
      mozPermissions = [
        "<all_urls>"
        "webRequest"
        "webRequestBlocking"
        "storage"
        "unlimitedStorage"
        "contextMenus"
        "webNavigation"
        "tabs"
        "downloads"
        "*://*.google.com/*"
        "*://*.google.ad/*"
        "*://*.google.ae/*"
        "*://*.google.com.af/*"
        "*://*.google.com.ag/*"
        "*://*.google.com.ai/*"
        "*://*.google.al/*"
        "*://*.google.am/*"
        "*://*.google.co.ao/*"
        "*://*.google.com.ar/*"
        "*://*.google.as/*"
        "*://*.google.at/*"
        "*://*.google.com.au/*"
        "*://*.google.az/*"
        "*://*.google.ba/*"
        "*://*.google.com.bd/*"
        "*://*.google.be/*"
        "*://*.google.bf/*"
        "*://*.google.bg/*"
        "*://*.google.com.bh/*"
        "*://*.google.bi/*"
        "*://*.google.bj/*"
        "*://*.google.com.bn/*"
        "*://*.google.com.bo/*"
        "*://*.google.com.br/*"
        "*://*.google.bs/*"
        "*://*.google.bt/*"
        "*://*.google.co.bw/*"
        "*://*.google.by/*"
        "*://*.google.com.bz/*"
        "*://*.google.ca/*"
        "*://*.google.cd/*"
        "*://*.google.cf/*"
        "*://*.google.cg/*"
        "*://*.google.ch/*"
        "*://*.google.ci/*"
        "*://*.google.co.ck/*"
        "*://*.google.cl/*"
        "*://*.google.cm/*"
        "*://*.google.cn/*"
        "*://*.google.com.co/*"
        "*://*.google.co.cr/*"
        "*://*.google.com.cu/*"
        "*://*.google.cv/*"
        "*://*.google.com.cy/*"
        "*://*.google.cz/*"
        "*://*.google.de/*"
        "*://*.google.dj/*"
        "*://*.google.dk/*"
        "*://*.google.dm/*"
        "*://*.google.com.do/*"
        "*://*.google.dz/*"
        "*://*.google.com.ec/*"
        "*://*.google.ee/*"
        "*://*.google.com.eg/*"
        "*://*.google.es/*"
        "*://*.google.com.et/*"
        "*://*.google.fi/*"
        "*://*.google.com.fj/*"
        "*://*.google.fm/*"
        "*://*.google.fr/*"
        "*://*.google.ga/*"
        "*://*.google.ge/*"
        "*://*.google.gg/*"
        "*://*.google.com.gh/*"
        "*://*.google.com.gi/*"
        "*://*.google.gl/*"
        "*://*.google.gm/*"
        "*://*.google.gp/*"
        "*://*.google.gr/*"
        "*://*.google.com.gt/*"
        "*://*.google.gy/*"
        "*://*.google.com.hk/*"
        "*://*.google.hn/*"
        "*://*.google.hr/*"
        "*://*.google.ht/*"
        "*://*.google.hu/*"
        "*://*.google.co.id/*"
        "*://*.google.ie/*"
        "*://*.google.co.il/*"
        "*://*.google.im/*"
        "*://*.google.co.in/*"
        "*://*.google.iq/*"
        "*://*.google.is/*"
        "*://*.google.it/*"
        "*://*.google.je/*"
        "*://*.google.com.jm/*"
        "*://*.google.jo/*"
        "*://*.google.co.jp/*"
        "*://*.google.co.ke/*"
        "*://*.google.com.kh/*"
        "*://*.google.ki/*"
        "*://*.google.kg/*"
        "*://*.google.co.kr/*"
        "*://*.google.com.kw/*"
        "*://*.google.kz/*"
        "*://*.google.la/*"
        "*://*.google.com.lb/*"
        "*://*.google.li/*"
        "*://*.google.lk/*"
        "*://*.google.co.ls/*"
        "*://*.google.lt/*"
        "*://*.google.lu/*"
        "*://*.google.lv/*"
        "*://*.google.com.ly/*"
        "*://*.google.co.ma/*"
        "*://*.google.md/*"
        "*://*.google.me/*"
        "*://*.google.mg/*"
        "*://*.google.mk/*"
        "*://*.google.ml/*"
        "*://*.google.com.mm/*"
        "*://*.google.mn/*"
        "*://*.google.ms/*"
        "*://*.google.com.mt/*"
        "*://*.google.mu/*"
        "*://*.google.mv/*"
        "*://*.google.mw/*"
        "*://*.google.com.mx/*"
        "*://*.google.com.my/*"
        "*://*.google.co.mz/*"
        "*://*.google.com.na/*"
        "*://*.google.com.nf/*"
        "*://*.google.com.ng/*"
        "*://*.google.com.ni/*"
        "*://*.google.ne/*"
        "*://*.google.nl/*"
        "*://*.google.no/*"
        "*://*.google.com.np/*"
        "*://*.google.nr/*"
        "*://*.google.nu/*"
        "*://*.google.co.nz/*"
        "*://*.google.com.om/*"
        "*://*.google.com.pa/*"
        "*://*.google.com.pe/*"
        "*://*.google.com.pg/*"
        "*://*.google.com.ph/*"
        "*://*.google.com.pk/*"
        "*://*.google.pl/*"
        "*://*.google.pn/*"
        "*://*.google.com.pr/*"
        "*://*.google.ps/*"
        "*://*.google.pt/*"
        "*://*.google.com.py/*"
        "*://*.google.com.qa/*"
        "*://*.google.ro/*"
        "*://*.google.ru/*"
        "*://*.google.rw/*"
        "*://*.google.com.sa/*"
        "*://*.google.com.sb/*"
        "*://*.google.sc/*"
        "*://*.google.se/*"
        "*://*.google.com.sg/*"
        "*://*.google.sh/*"
        "*://*.google.si/*"
        "*://*.google.sk/*"
        "*://*.google.com.sl/*"
        "*://*.google.sn/*"
        "*://*.google.so/*"
        "*://*.google.sm/*"
        "*://*.google.sr/*"
        "*://*.google.st/*"
        "*://*.google.com.sv/*"
        "*://*.google.td/*"
        "*://*.google.tg/*"
        "*://*.google.co.th/*"
        "*://*.google.com.tj/*"
        "*://*.google.tk/*"
        "*://*.google.tl/*"
        "*://*.google.tm/*"
        "*://*.google.tn/*"
        "*://*.google.to/*"
        "*://*.google.com.tr/*"
        "*://*.google.tt/*"
        "*://*.google.com.tw/*"
        "*://*.google.co.tz/*"
        "*://*.google.com.ua/*"
        "*://*.google.co.ug/*"
        "*://*.google.co.uk/*"
        "*://*.google.com.uy/*"
        "*://*.google.co.uz/*"
        "*://*.google.com.vc/*"
        "*://*.google.co.ve/*"
        "*://*.google.vg/*"
        "*://*.google.co.vi/*"
        "*://*.google.com.vn/*"
        "*://*.google.vu/*"
        "*://*.google.ws/*"
        "*://*.google.rs/*"
        "*://*.google.co.za/*"
        "*://*.google.co.zm/*"
        "*://*.google.co.zw/*"
        "*://*.google.cat/*"
        "*://*.yandex.ru/*"
        "*://*.yandex.com/*"
        "*://*.ya.ru/*"
      ];
      platforms = platforms.all;
    };
  };
  "no-pdf-download" = buildFirefoxXpiAddon {
    pname = "no-pdf-download";
    version = "1.0.6";
    addonId = "{b9b25e4a-bdf4-4270-868c-3f619eaf437d}";
    url = "https://addons.mozilla.org/firefox/downloads/file/3020560/no_pdf_download-1.0.6.xpi";
    sha256 = "fa27b6729178a23ccf2eee07cd7650d841fc6040f2e5adfb919931b671ed79e6";
    meta = with lib; {
      homepage = "https://github.com/MorbZ/no-pdf-download";
      description = "Opens all PDF files directly in the browser.";
      license = licenses.mit;
      mozPermissions = [
        "webRequest"
        "webRequestBlocking"
        "<all_urls>"
      ];
      platforms = platforms.all;
    };
  };
  "sponsorblock" = buildFirefoxXpiAddon {
    pname = "sponsorblock";
    version = "5.11.5";
    addonId = "sponsorBlocker@ajay.app";
    url = "https://addons.mozilla.org/firefox/downloads/file/4424639/sponsorblock-5.11.5.xpi";
    sha256 = "4cb3a7061dbeb9869477fb2f991d39ccaf650941f83abe1e0c65511e971cb555";
    meta = with lib; {
      homepage = "https://sponsor.ajay.app";
      description = "Easily skip YouTube video sponsors. When you visit a YouTube video, the extension will check the database for reported sponsors and automatically skip known sponsors. You can also report sponsors in videos. Other browsers: https://sponsor.ajay.app";
      license = licenses.lgpl3;
      mozPermissions = [
        "storage"
        "scripting"
        "https://sponsor.ajay.app/*"
        "https://*.youtube.com/*"
        "https://www.youtube-nocookie.com/embed/*"
      ];
      platforms = platforms.all;
    };
  };
  "ublock-origin" = buildFirefoxXpiAddon {
    pname = "ublock-origin";
    version = "1.62.0";
    addonId = "uBlock0@raymondhill.net";
    url = "https://addons.mozilla.org/firefox/downloads/file/4412673/ublock_origin-1.62.0.xpi";
    sha256 = "8a9e02aa838c302fb14e2b5bc88a6036d36358aadd6f95168a145af2018ef1a3";
    meta = with lib; {
      homepage = "https://github.com/gorhill/uBlock#ublock-origin";
      description = "Finally, an efficient wide-spectrum content blocker. Easy on CPU and memory.";
      license = licenses.gpl3;
      mozPermissions = [
        "alarms"
        "dns"
        "menus"
        "privacy"
        "storage"
        "tabs"
        "unlimitedStorage"
        "webNavigation"
        "webRequest"
        "webRequestBlocking"
        "<all_urls>"
        "http://*/*"
        "https://*/*"
        "file://*/*"
        "https://easylist.to/*"
        "https://*.fanboy.co.nz/*"
        "https://filterlists.com/*"
        "https://forums.lanik.us/*"
        "https://github.com/*"
        "https://*.github.io/*"
        "https://github.com/uBlockOrigin/*"
        "https://ublockorigin.github.io/*"
        "https://*.reddit.com/r/uBlockOrigin/*"
      ];
      platforms = platforms.all;
    };
  };
}
