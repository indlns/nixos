{ config, pkgs, lib, hostName, ... }:

{
  virtualisation.docker = {
    enable = true;
    daemon.settings = {
      "default-address-pools" = [{ base = "172.80.0.0/16"; size = 24; }];
      "log-level" = "info";
    } // lib.optionalAttrs (hostName == "n10-nixos") {
      hosts = [
        "unix:///var/run/docker.sock"
        "tcp://0.0.0.0:2375"
      ];
    };
  };
}
