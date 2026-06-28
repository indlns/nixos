# Модуль `user/cli/opencode`

**Путь:** `modules/user/cli/opencode.nix`
**Назначение:** Установка CLI-утилиты OpenCode.
**Используется хостами:** Linux (через platform/linux)

## Описание

Добавляет пакет `opencode` в пользовательское окружение.

## Настройки

```nix
home.packages = with pkgs; [ opencode ];
```

## Параметры

Модуль не экспонирует пользовательских опций.
