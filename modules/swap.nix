{ config, pkgs, ... }: 

{
    swapDevices = [{
        device = "/swapfile";
        size = 8192; # 8GB
        }
    ];
}