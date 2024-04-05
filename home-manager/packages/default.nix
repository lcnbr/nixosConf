{pkgs, ...}: let
  prismlauncher = pkgs.prismlauncher.override {
    glfw = pkgs.glfw-wayland-minecraft;
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
    # centerpiece
    solaar
    morgen #cal made in ch
    figma-linux

    # chromium
    stremio
    cargo-flamegraph
    wget
    # spotify-tui
  ];
}
