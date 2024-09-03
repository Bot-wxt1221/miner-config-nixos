{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}:

{
  imports = [
    ./proxy.nix
    ./miner.nix
    ./network.nix
    ./nixos-1-hardware.nix
    ./boot.nix
  ];
  networking.hostName = "nixos-1";
}
