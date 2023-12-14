_: {
  programs = {
    ssh = {
      enable = true;
      hashKnownHosts = true;
      compression = true;
      matchBlocks = {
        "gluluon.tailb3264.ts.net" = {
          user = "lucienh";
        };
        "princess.ethz.ch" = {
          user = "lucihuber";
          identityFile = "~/.ssh/id_ed25519pers";
          identitiesOnly = true;
        };
      };
    };
  };
}
