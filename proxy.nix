{
  config,
  lib,
  pkgs,
  ...
}:
{
  systemd.services.xmrig-proxy = {
    enable = true;

    wantedBy = [ "multi-user.target" ];

    wants = [
      "network-online.target"
    ];

    serviceConfig = {
      Type = "simple";
      ExecStart = "${lib.getExe pkgs.xmrig-proxy} -o pool.hashvault.pro:443  --user ZEPHYR2TBe6hELPtyzNESeREMtVrx3DziTDfftLfScPq66K8h7fUxNbQGouJXHhRxYjgiNsyVwGJ4QzQf15W7viTEFPwLEYV6PW4G";
    };
  };
}
