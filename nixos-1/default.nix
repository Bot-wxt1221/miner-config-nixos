{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./nixos-1-hardware.nix
    ./nixos-1.nix
  ];
}
