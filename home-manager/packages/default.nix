{pkgs, ...}: {
  imports = [];
  home.packages = with pkgs; [
    prismlauncher
    glfw-wayland
  ];
}
