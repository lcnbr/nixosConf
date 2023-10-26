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
    unar
    wget
    spotify-tui
  ];
}
