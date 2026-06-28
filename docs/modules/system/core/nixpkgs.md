# Модуль `system/core/nixpkgs`

**Путь:** `modules/system/core/nixpkgs.nix`
**Назначение:** Конфигурация репозитория пакетов.
**Используется хостами:** все NixOS-хосты

## Описание

Разрешает установку несвободных (unfree) пакетов из nixpkgs.

## Настройки

```nix
nixpkgs.config.allowUnfree = true;
```

## Параметры

Модуль не экспонирует пользовательских опций.

## Пример подключения

```nix
imports = [ ./core/nixpkgs.nix ];
```
