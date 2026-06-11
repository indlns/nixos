{ config, pkgs, ... }:

{
    hardware.graphics = {
        extraPackages = with pkgs; [
        intel-media-driver   # VAAPI (iHD)
        vpl-gpu-rt           # Quick Sync / oneVPL
        intel-compute-runtime # OpenCL (опционально)
        ];
    };

    environment.sessionVariables = {
        LIBVA_DRIVER_NAME = "iHD";
    };

    hardware.enableRedistributableFirmware = true;
}