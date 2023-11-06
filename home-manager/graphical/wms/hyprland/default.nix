{
  inputs,
  pkgs,
  lib,
  ...
}: {
  imports = [./config.nix];

  home = {
    sessionVariables = {
      XCURSOR_SIZE = "24";
      WLR_NO_HARDWARE_CURSORS = "1";
      NIXOS_OZONE_WL = "1";
    };

    packages = with pkgs; [
      nwg-displays
      wlr-randr
    ];
  };

  systemd.user.services.swayidle.Install.WantedBy = lib.mkForce ["hyprland-session.target"];

  wayland.windowManager.hyprland.enable = true;
}
