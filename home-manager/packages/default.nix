{pkgs, ...}: {
  imports = [];
  home.packages = with pkgs; [
    prismlauncher
    glfw-wayland
    devbox
    zulip
    logiops
    wev
    wget
  ];
}
