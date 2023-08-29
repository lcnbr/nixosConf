_: {
  programs = {
    ssh = {
      enable = true;
      hashKnownHosts = true;
      compression = true;
      matchBlocks = {
        "aur" = {
          hostname = "aur.archlinux.org";
          identityFile = "~/.ssh/aur";
        };
      };
    };
  };
}
