{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [

  ];
  services.openssh.settings.PermitRootLogin = "yes";
  users.users."root".openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPfk1DLJF9a0qbrNYTGTzY59oPAO/+vU4GWA8/6U84U3 zigao"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIB9OCkgPcdNq/0S7e4UtyrxYfYCoQuS16aAsQqCUd6xp wxt@wxt-school-vmware"
  ];
  services.openssh.enable = true;
}
