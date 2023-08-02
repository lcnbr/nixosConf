let
  gluluon = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIK30uAdZkikvnqCOEf4baAcxYIPggPHucTrnXjj/Mn+X";
  systems = [gluluon];
  lcnbr = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGFQ9KaG5+v+Cn/U6WhpVvZJaJHOfZQLs4BjUdUj1zXe";
  users = [lcnbr];
in {
  "ikmail.age".publicKeys = [lcnbr gluluon];
  "bwsecret.age".publicKeys = [lcnbr gluluon];
}
