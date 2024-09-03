{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}:

{
  imports =
    [
    ];
  networking.hostName = "nixos-1";
  enableMinerProxy = true;
  enableXmrig = true;
  enableMihomo = true;
}
