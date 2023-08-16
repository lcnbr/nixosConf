{
  inputs',
  pkgs,
  ...
}: let
  marketplace-extensions = with inputs.nix-vscode-extensions.extensions.${pkgs.system}.vscode-marketplace; [
    julialang.language-julia
    ifplusor.semantic-lunaria
    gregoire.dance
  ];
in {
  imports = [];

  programs.vscode = {
    enable = true;

    # defaultEditor = true;
    settings = {
      theme = "catppuccin_latte";
    };
  };
}
