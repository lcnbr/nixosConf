{...}: {
  accounts.email = {
    accounts = {
      "google" = {
        address = "huberlulu@gmail.com";
        flavor = "gmail.com";
        userName = "huberlulu";
        realName = "Lucien Huber";
        passwordCommand = "";
        imap.host = "imap.gmail.com";
        smtp.host = "smtp.gmail.com";
        thunderbird.enable = true;
      };
      "personal" = {
        address = "me@lucien.ch";
        userName = "me@lchbr.ch";
        realName = "Lucien Huber";
        primary = true;
        imap.host = "mail.infomaniak.com";
        smtp.host = "mail.infomaniak.com";
        smtp.port = 465;
        imap.port = 993;
        thunderbird.enable = true;
      };
      "civil" = {
      };
    };
  };
}
