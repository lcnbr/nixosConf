_: {
  programs = {
    ssh = {
      enable = true;
      hashKnownHosts = true;
      compression = true;
      matchBlocks = {
        "gluluon" = {
          hostname="gluluon.tailb3264.ts.net";
          user = "lucienh";
        };
        "princess.ethz.ch" = {
          user = "lucihuber";
          identityFile = "~/.ssh/id_ed25519pers";
          identitiesOnly = true;
        };
        "awsluwiki"={
          hostname="ec2-18-132-167-240.eu-west-2.compute.amazonaws.com";
          user= "arch";
          identityFile = "~/.ssh/id_ed25519";
        };

      };
    };
  };
}
