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
      owner = "C3Pool";
      repo = "xmrig-proxy";
      rev = "v6.22.0-C3";
      hash = "sha256-mWPKiKCpWA5duNIYKzlGZw6Fat+nNGCHjQez7R8IPII=";
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
        ExecStart = "${lib.getExe xmrig-proxy-mod} -o auto.c3pool.org:19999 --user 46gcJK4PsJwjbu8dBNHtYiPYr5e9cL26VLf4eMVPDvEDB25FVLrVJScaiT4paymKh4YwD5BXLvmy3Uw1ZinduK4YEg71CwZ";
      };
    };
  };
}
