_: {
  imports = [
    # ./gpg.nix
    ./ssh.nix
  ];
  config = {
    services = {
      udiskie.enable = true;
    };
  };
}
