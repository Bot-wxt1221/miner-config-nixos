{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [

  ];
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "nodev";
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.efiSupport = true;
  boot.kernelPackages = lib.mkDefault pkgs.linuxPackages_zen;
  hardware.firmware = [ pkgs.linux-firmware ];
}
