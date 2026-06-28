# Модуль `system/core/locale`

**Путь:** `modules/system/core/locale.nix`
**Назначение:** Локализация и кодировки.
**Используется хостами:** все NixOS-хосты

## Описание

Устанавливает часовой пояс `Asia/Yekaterinburg` и локаль `ru_RU.UTF-8` для всех категорий (LC_*).

## Настройки

```nix
time.timeZone = "Asia/Yekaterinburg";
i18n.defaultLocale = "ru_RU.UTF-8";
i18n.extraLocaleSettings = {
  LC_ADDRESS = "ru_RU.UTF-8";
  LC_IDENTIFICATION = "ru_RU.UTF-8";
  LC_MEASUREMENT = "ru_RU.UTF-8";
  LC_MONETARY = "ru_RU.UTF-8";
  LC_NAME = "ru_RU.UTF-8";
  LC_NUMERIC = "ru_RU.UTF-8";
  LC_PAPER = "ru_RU.UTF-8";
  LC_TELEPHONE = "ru_RU.UTF-8";
  LC_TIME = "ru_RU.UTF-8";
};
```

## Параметры

Модуль не экспонирует пользовательских опций.
