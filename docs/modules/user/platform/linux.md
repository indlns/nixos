# Модуль `user/platform/linux`

**Путь:** `modules/user/platform/linux/default.nix`
**Назначение:** Linux-платформа: импорт common + opencode + zsh + bash.
**Используется хостами:** home/indlns.nix (NixOS через Home-Manager)

## Описание

Точка входа для Linux. Импортирует общие модули (git, lf), OpenCode, Zsh и Bash.

## Импорты

```nix
imports = [
  ../../common/default.nix
  ../../cli/opencode.nix
  ../../shell/bash.nix
  ../../shell/zsh.nix
];
```

## Параметры

Модуль не экспонирует пользовательских опций.

## См. также

- [common](../common.md) — git, lf
- [cli/opencode](../cli/opencode.md) — OpenCode CLI
- [shell/zsh](../shell/zsh.md) — Zsh для Linux
- [shell/bash](../shell/bash.md) — Bash
