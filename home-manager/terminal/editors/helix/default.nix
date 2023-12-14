{
  inputs',
  pkgs,
  ...
}: {
  imports = [./languages.nix];

  programs.helix = {
    enable = true;

    # defaultEditor = true;
    settings = {
      theme = "catppuccin_frappe";
      editor = {
        color-modes = true;
        cursorline = true;
        soft-wrap.enable = true;
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
        indent-guides = {
          render = true;
        };
        lsp.display-inlay-hints = true;
        statusline.center = ["position-percentage"];
        true-color = true;
        whitespace.characters = {
          newline = "↴";
          tab = "⇥";
        };
      };

      keys.normal.space.u = {
        f = ":format"; # format using LSP formatter
        w = ":set whitespace.render all";
        W = ":set whitespace.render none";
      };
    };
  };
}
