
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
    ];

    language-server = {
        nil = {
        command = lib.getExe pkgs.nil;
        config.nil.formatting.command = ["${lib.getExe pkgs.alejandra}" "-q"];
      };

     };
  };
}