{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [

  ];
  options = {
    enableMihomo = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf config.enableMihomo {
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

  };
}
