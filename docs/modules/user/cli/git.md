# Модуль `user/cli/git`

**Путь:** `modules/user/cli/git.nix`
**Назначение:** Настройки Git.
**Используется хостами:** все (через common)

## Описание

Настраивает Git: пользователь `indlns`, email, credential store.

## Настройки

```nix
programs.git = {
  enable = true;

  settings = {
    user = {
      name = "indlns";
      email = "theindlns@gmail.com";
    };

    credential = {
      helper = "store";
    };
  };
};
```

## Экспортируемые опции Home-Manager

| Опция | Тип | По умолчанию | Описание |
|-------|-----|-------------|-----------|
| `programs.git.enable` | bool | `true` | Включает Git |
| `programs.git.settings.user.name` | string | `"indlns"` | Имя пользователя |
| `programs.git.settings.user.email` | string | `"theindlns@gmail.com"` | Email пользователя |
| `programs.git.settings.credential.helper` | string | `"store"` | Хранилище учётных данных |

## Заметки

- Credential store хранит пароли в открытом виде в `~/.git-credentials`.
