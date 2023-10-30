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
      };
    };
  };
}
