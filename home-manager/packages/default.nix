{pkgs, ...}: let
  prismlauncher = pkgs.prismlauncher.override {
    glfw = pkgs.glfw-wayland-minecraft;
  };
  zed-fhs = pkgs.buildFHSUserEnv {
    name = "zed";
    targetPkgs = pkgs:
      with pkgs; [
        zed-editor
      ];
    runScript = "zed";
  };
in {
  imports = [];
  home.packages = with pkgs; [
    prismlauncher
    glfw-wayland
    devbox
    okular
    albert
    beeper
    localsend
    zulip
    logiops
    whatsapp-for-linux
    zoom-us
    wev
    upower
    discord
    cudaPackages.cudatoolkit
    xorg.libxcb
    glxinfo
    lapce
    unar
    poppler
    tesseract
    # centerpiece
    solaar
    morgen #cal made in ch
    figma-linux
    cosmic-files
    zed-fhs
    goldwarden
    # wluma # chromium
    stremio
    cargo-flamegraph
    wget
    warp-terminal
    gnome-font-viewer

    # spotify-tui
  ];
}
