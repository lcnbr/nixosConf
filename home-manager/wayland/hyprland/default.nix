{
  inputs,
  pkgs,
  lib,
  ...
}:
{
  imports = [./config.nix];

  systemd.user.services.swayidle.Install.WantedBy = lib.mkForce ["hyprland-session.target"];

  wayland.windowManager.hyprland.enable = true;
}