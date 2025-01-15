{
  pkgs,
  inputs,
  ...
}: let
  prismlauncher = pkgs.prismlauncher.override {
    # glfw = pkgs.glfw-wayland-minecraft;
  };
  # zed-fhs = pkgs.buildFHSUserEnv {
  #   name = "zed";
  #   targetPkgs = pkgs:
  #     with pkgs; [
  #       zed-editor
  #     ];
  #   runScript = "zed";
  # };
  openfortivpn = pkgs.openfortivpn.overrideAttrs(old:{
  src = pkgs.fetchFromGitHub {
          owner = "Rainer-Keller";
          repo = "openfortivpn-saml";
          rev = "400c7873ea5c4dd3792dedc863ae35293856bbd2";
          sha256 = "sha256-VOyZWBvi+z678MS1Eaf0IOA2YXEd0DGKBB4FXLeyQxM=";
        };

  });
in {
  imports = [];
  home.packages = with pkgs; [
  openfortivpn
  #jitsi-meet-electron
    zed-editor.fhs
    prismlauncher
    kmeet
    mathematica
    bitwarden-desktop
    # comma
    devenv
    glfw-wayland
    devbox
    okular
    albert
    beeper
    localsend
    zulip
    logiops
    whatsapp-for-linux
    ripgrep
    spotify
    zoom-us
    wev
    upower
    discord
    jujutsu
    # cudaPackages.cudatoolkit
    xorg.libxcb
    glxinfo
    lapce
    unar
    poppler
    tesseract
    # centerpiece
    solaar
    morgen #cal made in ch
    figma-linux
    cosmic-files

    goldwarden
    # wluma # chromium
    stremio
    cargo-flamegraph
    wget
    warp-terminal
    gnome-font-viewer

    # spotify-tui
  ];
}
