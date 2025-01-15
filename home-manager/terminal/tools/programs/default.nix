{...}: {
  imports = [
    ./xplr
    ./direnv
    ./bottom
    ./yazi
  ];
   programs.nix-index-database.comma.enable = true;
}
