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
  networking.networkmanager.enable = true;
  networking.firewall.enable = false;
  services.openssh.settings.PermitRootLogin = "yes";
  users.users."root".openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPfk1DLJF9a0qbrNYTGTzY59oPAO/+vU4GWA8/6U84U3 zigao"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIB9OCkgPcdNq/0S7e4UtyrxYfYCoQuS16aAsQqCUd6xp wxt@wxt-school-vmware" 
  ];
  services.openssh.enable = true;
  system.stateVersion = "unstable"; # Did you read the comment?
  nix.settings.substituters = [
    "https://mirrors.ustc.edu.cn/nix-channels/store"
    "https://nix-community.cachix.org"
    "https://wxt1221.cachix.org"
    "https://cuda-maintainers.cachix.org"
    "https://luogu-judge.cachix.org"
  ];
  nix.settings.trusted-users = [
    "root"
    "wxt"
  ];
  nix.settings.trusted-public-keys = [
    "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    "wxt1221.cachix.org-1:JmeZ+5reEo1i5qBc6X+2hEadoN5GFqTOQcwaGD5PEwY="
    "cuda-maintainers.cachix.org-1:0dq3bujKpuEPMCX6U4WylrUDZ9JyUG0VpVZa7CNfq5E="
    "luogu-judge.cachix.org-1:vBoiA0n//KfYZ5Xp5HhcujXcdT7dK3+rEK3U4zw66TQ="
  ];
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
  };
}
