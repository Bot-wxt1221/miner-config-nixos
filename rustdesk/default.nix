{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [

  ];
  systemd.services.rustdesk = {
    enable = true;
    description = "rustdesk";
    serviceConfig = {
      ExecStart = "${pkgs.rustdesk-flutter}/bin/rustdesk --service";
      ExecStop = "pkill -f \"rustdesk --\"";
      PIDFile = "/run/rustdesk.pid";
      KillMode = "mixed";
      TimeoutStopSec = "30";
      User = "root";
      LimitNOFILE = "100000";
    };
    wantedBy = [ "multi-user.target" ];
    requires = [ "network-online.target" ];
  };
  environment.systemPackages = with pkgs; [ rustdesk-flutter ];
}
