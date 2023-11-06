{pkgs, ...}: {
  imports = [];
  home.packages = with pkgs; [
    prismlauncher
    glfw-wayland
    devbox
    localsend
    zulip
    logiops
    wev
    beeper
    lapce
    unar
    solaar
    morgen #cal made in ch
    wget
    spotify-tui
  ];
}
