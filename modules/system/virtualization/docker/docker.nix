{ config, pkgs, ... }:

{
virtualisation.docker.enable = true;
  virtualisation.docker.daemon.settings = {
    "default-address-pools" = [
      { base = "172.80.0.0/16"; size = 24; }
    ];
    "log-level" = "info";
  };
}
