{
  config,
  pkgs,
  lib,
  ...
}:
let
  xmrig-mod = pkgs.xmrig.overrideAttrs (oldAttrs: {
    version = "6.22.0";

    src = pkgs.fetchFromGitHub {
      owner = "C3Pool";
      repo = "xmrig-C3";
      rev = "v6.22.0-C5";
      hash = "sha256-VpBYhGlyTnFybhBhyniMT6Q/p876EWTr+M49uX/68wY=";
    };

    env.NIX_CFLAGS_COMPILE = toString [
      "-march=x86-64-v3"
    ];

    env.NIX_CXXFLAGS_COMPILE = toString [
      "-march=x86-64-v3"
    ];
  });
in
{
  options = {
    enableXmrig = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf config.enableXmrig {
    environment.systemPackages = with pkgs; [
      xmrig-mod
    ];

    services.xmrig = {
      enable = true;
      package = xmrig-mod;
      settings = builtins.fromJSON (builtins.readFile ./miner.json);
    };
  };
}
