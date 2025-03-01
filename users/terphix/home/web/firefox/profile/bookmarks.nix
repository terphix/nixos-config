{
  programs.firefox.profiles.default.bookmarks = [
    {
      name = "Bookmarks Toolbar";
      toolbar = true;
      bookmarks = [
        {
          name = "GitHub";
          tags = [ "github" ];
          keyword = "github";
          url = "https://github.com/terphix";
        }
        {
          name = "DeepL";
          tags = [ "deepl" ];
          keyword = "deepl";
          url = "https://www.deepl.com/ru/translator";
        }
        {
          name = "Telegram";
          tags = [ "tg" ];
          keyword = "tg";
          url = "https://web.telegram.org/k/";
        }
        {
          name = "Proton";
          tags = [ "proton" ];
          keyword = "proton";
          url = "https://mail.proton.me/u/0/inbox";
        }
      ];
    }
  ];
}
