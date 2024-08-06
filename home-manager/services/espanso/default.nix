{pkgs, ...}: {
  services.espanso = {
    enable = false;
    package = pkgs.espanso-wayland;
  };
}
