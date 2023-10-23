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

    wget
    spotify-tui
  ];
}
