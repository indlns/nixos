{ config, pkgs, ... }:

{
    # NVIDIA DRIVER (HEADLESS SAFE)
    hardware.nvidia = {
        modesetting.enable = true;
        # Ada Lovelace → open kernel modules (рекомендуется)
        open = true;
        nvidiaSettings = false; # GUI не нужен
        package = config.boot.kernelPackages.nvidiaPackages.stable;
        powerManagement = {
        enable = true;
        finegrained = false;
        };

        # ВАЖНО для headless стабильности
        nvidiaPersistenced = true;
    };

    # Чтобы GPU не "засыпал" как на desktop системах
    systemd.services.nvidia-persistenced = {
        wantedBy = [ "multi-user.target" ];
        serviceConfig = {
        ExecStart = "${pkgs.nvidia_x11}/bin/nvidia-persistenced --verbose";
        };
    };
}