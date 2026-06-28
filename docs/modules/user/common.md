# Модуль `user/common`

**Путь:** `modules/user/common/default.nix`
**Назначение:** Общие пользовательские модули (git, lf).
**Используется хостами:** все (через platform/macos и platform/linux)

## Описание

Точка входа для общих пользовательских настроек. Импортирует `cli/git.nix` и `cli/lf.nix`.

## Импорты

```nix
imports = [
  ../cli/git.nix
  ../cli/lf.nix
];
```

## Параметры

Модуль не экспонирует пользовательских опций.

## См. также

- [cli/git](cli/git.md) — настройки Git
- [cli/lf](cli/lf.md) — файловый менеджер lf
