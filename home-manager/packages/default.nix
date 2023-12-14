{pkgs, ...}: {
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
    solaar
    morgen #cal made in ch
    wget
    spotify-tui
  ];
}
