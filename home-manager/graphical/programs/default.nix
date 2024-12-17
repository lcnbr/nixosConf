{...}: {
  imports = [
    ./thunderbird.nix
    ./zen-browser.nix
  ];

  programs.obs-studio.enable = true;
}
