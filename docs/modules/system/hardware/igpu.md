# Модуль `system/hardware/igpu`

**Путь:** `modules/system/hardware/igpu.nix`
**Назначение:** Поддержка интегрированного GPU Intel.
**Используется хостами:** ms-02

## Описание

Настраивает Intel iGPU для аппаратного декодирования видео (VAAPI, Quick Sync) и OpenCL-вычислений.

## Настройки

```nix
hardware.graphics.extraPackages = with pkgs; [
  intel-media-driver    # VAAPI (iHD)
  vpl-gpu-rt            # Quick Sync / oneVPL
  intel-compute-runtime # OpenCL (опционально)
];

environment.sessionVariables = {
  LIBVA_DRIVER_NAME = "iHD";
};

hardware.enableRedistributableFirmware = true;
```

## Устанавливаемые компоненты

| Пакет | Назначение |
|-------|------------|
| intel-media-driver | VAAPI-драйвер для декодирования видео (iHD) |
| vpl-gpu-rt | Quick Sync / oneVPL для аппаратного кодирования |
| intel-compute-runtime | OpenCL для вычислений на GPU |

## Параметры

Модуль не экспонирует пользовательских опций.
