{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [

  ];
  systemd.services.mihomo = {
    enable = true;

    wantedBy = [ "multi-user.target" ];

    wants = [
      "network-online.target"
    ];

    serviceConfig = {
      Type = "simple";
      ExecStart = "${lib.getExe pkgs.mihomo} -f ${./clash-verge.yaml} -d /root";
    };
  };

}
