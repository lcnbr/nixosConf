{
  programs.thunderbird = {
    enable = true;

    settings = {"privacy.donottrackheader.enabled" = true;};
    profiles = {
      default = {
        isDefault = true;
        settings = {
          # 9205: Avoid information leakage in reply header
          "mailnews.reply_header_type" = 0;
          "mailnews.reply_header_originalmessage" = "";
          # Sort by date in descending order using threaded view
          "mailnews.default_sort_type" = 18;
          "mailnews.default_sort_order" = 2;
          "mailnews.default_view_flags" = 1;
          "mailnews.default_news_sort_type" = 18;
          "mailnews.default_news_sort_order" = 2;
          "mailnews.default_news_view_flags" = 1;
        };
      };
    };
  };
}
