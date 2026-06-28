# Модуль `system/security/ssh`

**Путь:** `modules/system/security/ssh.nix`
**Назначение:** Настройка SSH-сервера (OpenSSH).
**Используется хостами:** все NixOS-хосты

## Описание

Включает OpenSSH с отключённым входом по паролю и запретом root-доступа.

## Настройки

```nix
services.openssh = {
  enable = true;
  settings = {
    PermitRootLogin = "no";
    PasswordAuthentication = false;
  };
};
```

## Параметры

| Параметр | Значение | Описание |
|----------|----------|----------|
| `PermitRootLogin` | `"no"` | Root-вход запрещён |
| `PasswordAuthentication` | `false` | Вход только по SSH-ключам |

## Заметки

Для доступа необходимо добавить SSH-ключи в `modules/system/core/users.nix`.
