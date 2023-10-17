{
  inputs,
  pkgs,
  ...
}: let
  marketplace-extensions = with inputs.nix-vscode-extensions.extensions.${pkgs.system}.vscode-marketplace; [
    julialang.language-julia
    ifplusor.semantic-lunaria
  ];
in {
  imports = [];

  programs.vscode = {
    enable = true;

    enableExtensionUpdateCheck = false;
    enableUpdateCheck = false;
    extensions = with pkgs.vscode-extensions;
      [
        kamadorueda.alejandra
        ms-python.python
        rust-lang.rust-analyzer
        eamodio.gitlens
        bbenoist.nix
        arrterian.nix-env-selector
        ms-toolsai.jupyter
        ms-python.vscode-pylance
        tailscale.vscode-tailscale
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
      "keyboard.dispatch" = "keyCode";
    };
  };
}
