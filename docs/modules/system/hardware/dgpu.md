# Модуль `system/hardware/dgpu`

**Путь:** `modules/system/hardware/dgpu.nix`
**Назначение:** Поддержка дискретного NVIDIA GPU.
**Используется хостами:** ms-02

## Описание

Настраивает NVIDIA GPU: драйвер, modesetting, persistent mode, container toolkit для Docker GPU-passthrough.

## Настройки

```nix
services.xserver.videoDrivers = [ "nvidia" ];

hardware.nvidia = {
  modesetting.enable = true;
  open = false;
  nvidiaSettings = false;
  package = config.boot.kernelPackages.nvidiaPackages.stable;
  nvidiaPersistenced = true;
};

# Docker GPU passthrough
hardware.nvidia-container-toolkit.enable = true;

environment.systemPackages = with pkgs; [
  nvidia-docker
];

boot.kernel.sysctl."vm.max_map_count" = "2147483642";

# CDI generator (включён, несмотря на потенциальные проблемы при загрузке)
systemd.services.nvidia-container-toolkit-cdi-generator.enable = true;
```

## Параметры

| Параметр | Значение | Описание |
|----------|----------|----------|
| `modesetting.enable` | `true` | Включает KMS для NVIDIA |
| `open` | `false` | Закрытый драйвер |
| `nvidiaPersistenced` | `true` | Persistent mode (GPU не засыпает) |
| `vm.max_map_count` | `2147483642` | Увеличенный лимит mmap для контейнеров |

## Зависимости

- Требует `hardware/graphics.nix` (OpenGL)
- Автоматически подключается для `hostName == "ms-02"`

## См. также

- [virtualization/docker](../virtualization/docker.md) — Docker с GPU-passthrough
