{pkgs, ...}: {
  imports = [];
  home.packages = with pkgs; [
    prismlauncher
    glfw-wayland
    inkscape

    texlive.combined.scheme-medium
  ];
}
