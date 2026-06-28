# Модуль `user/shell/bash`

**Путь:** `modules/user/shell/bash.nix`
**Назначение:** Пользовательская конфигурация Bash.
**Используется хостами:** Linux (через platform/linux)

## Описание

Настраивает Bash: алиас `rebuild` для быстрого обновления системы, fastfetch при SSH.

## Настройки

```nix
programs.bash = {
  enable = true;
  shellAliases = {
    rebuild = "sudo nixos-rebuild switch";
  };

  initExtra = ''
    if [[ -n "$SSH_CONNECTION" ]]; then
      fastfetch
    fi
  '';
};
```

## Экспортируемые опции Home-Manager

| Опция | Тип | По умолчанию | Описание |
|-------|-----|-------------|-----------|
| `programs.bash.enable` | bool | `true` | Включает Bash |
| `programs.bash.shellAliases` | attrset | `{ rebuild = "sudo nixos-rebuild switch"; }` | Алиасы оболочки |
| `programs.bash.initExtra` | string | fastfetch при SSH | Дополнительный код при старте |

## Алиасы

| Алиас | Команда | Описание |
|-------|---------|----------|
| `rebuild` | `sudo nixos-rebuild switch` | Быстрое обновление системы |
