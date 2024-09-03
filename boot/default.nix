{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./boot.nix
    ./network.nix
    ./nix.nix
    ./openssh.nix
  ];
}
