{
  pkgs,
  lib,
  ...
}: {
  programs.helix.languages = {
    language = [
      {
        name = "bash";
        auto-format = true;
        formatter = {
          command = "${pkgs.shfmt}/bin/shfmt";
          args = ["-i" "2" "-"];
        };
      }

      {
        name = "nix";
        auto-format = true;
        formatter = {
          command = "${lib.getExe pkgs.alejandra}";
        };
      }
      {
        name = "typst";
        scope = "source.typst";
        injection-regex = "typst";
        roots = [];
        comment-token = "//";
        file-types = ["typ"];
        indent = {
          tab-width = 2;
          unit = " ";
        };
        text-width = 100;
        language-server = {command = "typst-lsp";};
        rulers = [100];
        soft-wrap.wrap-at-text-width = true;
      }
    ];
    language-server = {
      nil = {
        command = lib.getExe pkgs.nil;
        config.nil.formatting.command = ["${lib.getExe pkgs.alejandra}" "-q"];
      };
      typst-lsp = {
        command = lib.getExe pkgs.typst-lsp;
      };
    };
    grammar = [
      {
        name = "typst";
        source = {
          git = "https://github.com/frozolotl/tree-sitter-typst";
          rev = "50915c5fefd6d6d2f48b3e6da7136cb0138b160a";
        };
      }
    ];
  };
}
