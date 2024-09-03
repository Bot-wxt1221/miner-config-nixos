{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [

  ];
  networking.networkmanager.enable = true;
  networking.firewall.enable = false;
}
