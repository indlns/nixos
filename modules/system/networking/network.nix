{ config, pkgs, lib, hostName, ... }:

{
    networking.hostName = hostName;
    networking.networkmanager.enable = true;

    networking.firewall = {
        allowedTCPPorts = [ 80 443 32400 ]
        ++ lib.optionals (hostName == "ms-02") [ 9100 ]
        ++ lib.optionals (hostName == "n10-nixos") [ 2375 ];
        allowedUDPPorts = [ 42873 ];
        enable = hostName != "ms-02";
    };
}
