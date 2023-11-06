{
  inputs,
  pkgs,
  ...
}: let
  marketplace-extensions = with inputs.nix-vscode-extensions.extensions.${pkgs.system}.vscode-marketplace; [
    julialang.language-julia
    ifplusor.semantic-lunaria
    mkhl.direnv
  ];
  pinnednixpkgs = import (builtins.fetchTarball {
    name = "my-pinned-nixpkgs";#to version 1.81
    url = "https://github.com/NixOS/nixpkgs/archive/efd23a1c9ae8c574e2ca923c2b2dc336797f4cc4.tar.gz";
  }) {config = {
      allowUnfree = true;
    };};

in {
  imports = [];
  

  programs.vscode = {
    enable = true;
    package= pinnednixpkgs.vscode;

    enableExtensionUpdateCheck = false;
    enableUpdateCheck = false;
    extensions = with pkgs.vscode-extensions;
      [
        kamadorueda.alejandra
        ms-python.python
        rust-lang.rust-analyzer
        eamodio.gitlens
        bbenoist.nix
        tomoki1207.pdf
        arrterian.nix-env-selector
        ms-vscode-remote.remote-ssh
        ms-toolsai.jupyter
        ms-python.vscode-pylance
        # tailscale.vscode-tailscale
        denoland.vscode-deno
        ritwickdey.liveserver
        github.copilot
        github.copilot-chat
        foam.foam-vscode
        bmewburn.vscode-intelephense-client
      ]
      ++ marketplace-extensions;
    userSettings = {
      "terminal.integrated.defaultProfile.linux" = "nu";
      "workbench.colorTheme" = "Semantic Lunaria Light"; #theme, want to modify it 22.5.23
      "git.enableSmartCommit" = true; # autofetch and things
      "git.confirmSync" = false;
      "git.autofetch" = true;
      "terminal.integrated.commandsToSkipShell" = [
        "language-julia.interrupt"
      ];
      "julia.symbolCacheDownload" = true;

      "julia.enableTelemetry" = false;
      "keyboard.dispatch" = "keyCode";
      "foam.completion.useAlias" = "whenPathDiffersFromTitle";
      "foam.files.defaultNoteExtension" = "typ";
      "foam.openDailyNote.fileExtension" = "typ";
    };
  };
}
