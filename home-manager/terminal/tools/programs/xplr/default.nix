{pkgs, ...}: let
  # get plugin derivations from plugins.nix so that this file remains clean
  inherit (import ./plugins.nix pkgs) wl-clipboard-plugin nuke-plugin;
in {
  # programs.xplr = {
  #   enable = true;
  #   plugins = [
  #     nuke-plugin
  #   ];
  # };
}
