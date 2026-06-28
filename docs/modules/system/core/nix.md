# Модуль `system/core/nix`

**Путь:** `modules/system/core/nix.nix`
**Назначение:** Конфигурация Nix пакетного менеджера.
**Используется хостами:** все NixOS-хосты

## Описание

Включает experimental-features `nix-command` и `flakes`, а также `nix-ld` для запуска не-Nix бинарников.

## Настройки

```nix
programs.nix-ld.enable = true;
nix.settings.experimental-features = [ "nix-command" "flakes" ];
```

## Параметры

Модуль не экспонирует пользовательских опций.

## Пример подключения

```nix
imports = [ ./core/nix.nix ];
```
