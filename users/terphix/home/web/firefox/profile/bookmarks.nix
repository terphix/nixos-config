{
  programs.firefox.profiles.default.bookmarks = [
    {
      name = "Bookmarks Toolbar";
      toolbar = true;
      bookmarks = [
        {
          name = "Git";
          tags = [ "git" ];
          keyword = "git";
          url = "https://terphix.duckdns.org/main";
        }
        {
          name = "GitHub";
          tags = [ "github" ];
          keyword = "github";
          url = "https://github.com/terphix";
        }
        {
          name = "LeetCode";
          tags = [ "leetcode" ];
          keyword = "leetcode";
          url = "https://leetcode.com/problemset/";
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
        {
          name = "Yahoo";
          tags = [ "yahoo" ];
          keyword = "yahoo";
          url = "https://mail.yahoo.com/d/folders/1";
        }
      ];
    }
  ];
}
