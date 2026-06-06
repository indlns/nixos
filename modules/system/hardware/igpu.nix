{ config, pkgs, ... }:

{
    hardware.graphics = {
        enable = true;
        extraPackages = with pkgs; [
        intel-media-driver
        ];
    };

    environment.sessionVariables = {
        LIBVA_DRIVER_NAME = "iHD";
        VDPAU_DRIVER = "va_gl";
    };
}