{pkgs, ...}: {
  imports = [./plugins.nix];
  programs.xplr = {
    enable = true;
    plugins = [
      pkgs.nuke-plugin
    ];
  };
}
