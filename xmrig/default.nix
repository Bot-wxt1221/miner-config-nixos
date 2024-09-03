{
  config,
  pkgs,
  lib,
  ...
}:

{
  options = {
    enableXmrig = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf config.enableXmrig {
    environment.systemPackages = with pkgs; [
      xmrig
    ];

    services.xmrig = {
      enable = true;
      settings = builtins.fromJSON (builtins.readFile ./miner.json);
    };
  };
}
