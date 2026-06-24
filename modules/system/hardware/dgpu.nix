{ config, pkgs, ... }:

{
    services.xserver.videoDrivers = [ "nvidia" ];

    hardware.nvidia = {
        modesetting.enable = true;
        open = false;
        nvidiaSettings = false;
        package = config.boot.kernelPackages.nvidiaPackages.stable;

        nvidiaPersistenced = true;
    };

    # === Docker GPU passthrough ===
    hardware.nvidia-container-toolkit.enable = true;

    # === Доп. пакеты ===
    environment.systemPackages = with pkgs; [
        nvidia-docker
    ];

    boot.kernel.sysctl."vm.max_map_count" = "2147483642";

    # CDI generator штатный отключаем (падает до загрузки драйвера)
    systemd.services.nvidia-container-toolkit-cdi-generator.enable = true;
}