# Модуль `user/platform/macos`

**Путь:** `modules/user/platform/macos/default.nix`
**Назначение:** macOS-платформа: импорт common + zsh-macos.
**Используется хостами:** macbook-pro, mac-mini

## Описание

Точка входа для macOS. Импортирует общие модули (git, lf) и macOS-специфичную оболочку zsh.

## Импорты

```nix
imports = [
  ../../common/default.nix
  ../../shell/zsh-macos.nix
];
```

## Параметры

Модуль не экспонирует пользовательских опций.

## См. также

- [common](../common.md) — git, lf
- [shell/zsh-macos](../shell/zsh-macos.md) — Zsh для macOS
