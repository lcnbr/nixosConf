{pkgs, ...}: {
  imports = [];
  home.packages = with pkgs; [
    prismlauncher
    glfw-wayland
    devbox
    okular
    albert
    localsend
    zulip
    logiops
    whatsapp-for-linux
    zoom-us
    wev
    beeper
    cudaPackages_12_2.cudatoolkit
    xorg.libxcb
    glxinfo
    lapce
    unar
    solaar
    morgen #cal made in ch
    wget
    spotify-tui
  ];
}
