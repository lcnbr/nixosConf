{...}: {
  accounts.email = {
    accounts = {
      "google" = {
        address = "huberlulu@gmail.com";
        flavor = "gmail.com";
        userName = "huberlulu";
        realName = "Lucien Huber";
        imap.host = "imap.gmail.com";
        smtp.host = "smtp.gmail.com";
        aerc.imapAuth = "xoauth2";
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
      "unibe" = {
        address = "lucien.huber@unibe.ch";
        userName = "lucien.huber@unibe.ch";
        realName = "Lucien Huber";
        imap.host = "outlook.office365.com";
        smtp.host = "smtp.office365.com";
        smtp.tls.useStartTls = true;
        aerc.smtpAuth = "xoauth2";
        aerc.imapAuth = "xoauth2";
        smtp.port = 587;
        imap.port = 993;
        thunderbird.enable = true;
      };
    };
  };
}
