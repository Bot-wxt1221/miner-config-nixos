{
  config,
  lib,
  pkgs,
  ...
}:
let
  xmrig-proxy-mod = pkgs.xmrig-proxy.overrideAttrs (oldAttrs: {
    version = "6.22.0";

    src = pkgs.fetchFromGitHub {
      owner = "xmrig";
      repo = "xmrig-proxy";
      rev = "v6.22.0";
      hash = "sha256-qRn/FiYvogGFUIUj3CojtfO6fXRZghH+bgRP+ysI6mc=";
    };
  });
in
{
  options = {
    enableMinerProxy = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf config.enableMinerProxy {
    systemd.services.xmrig-proxy = {
      enable = true;

      wantedBy = [ "multi-user.target" ];

      wants = [
        "network-online.target"
      ];

      serviceConfig = {
        Type = "simple";
        ExecStart = "${lib.getExe xmrig-proxy-mod} -o pool.hashvault.pro:443  --user ZEPHYR2TBe6hELPtyzNESeREMtVrx3DziTDfftLfScPq66K8h7fUxNbQGouJXHhRxYjgiNsyVwGJ4QzQf15W7viTEFPwLEYV6PW4G";
      };
    };
  };
}
