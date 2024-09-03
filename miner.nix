{
  config,
  pkgs,
  lib,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    xmrig
  ];

  services.xmrig = {
    enable = true;
    settings = builtins.fromJSON (builtins.readFile ./miner.json);
  };
}
