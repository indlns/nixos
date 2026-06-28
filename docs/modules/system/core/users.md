# Модуль `system/core/users`

**Путь:** `modules/system/core/users.nix`
**Назначение:** Учётные записи пользователей и их права.
**Используется хостами:** все NixOS-хосты

## Описание

Создаёт пользователя `indlns` с правамиsudo, группами networkmanager/docker/video/render, оболочкой zsh и SSH-ключами.

## Настройки

```nix
users.users.indlns = {
  isNormalUser = true;
  description = "Evgenij";
  extraGroups = [ "networkmanager" "wheel" "docker" "video" "render" ];
  shell = pkgs.zsh;
  openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIC06lalETXk8PZS1bG4eK1gxiOPjo6mh9rBHa4sq6x46 theindlns@gmail.com"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIIE8gEPkO8ldgeasbEh5DUJc55tp1LjwK18uGQRg2mW theindlns@gmail.com"
  ];
};
```

## Группы пользователя

| Группа | Назначение |
|--------|------------|
| networkmanager | Управление сетью |
| wheel | Доступ к sudo |
| docker | Управление Docker |
| video | Доступ к GPU |
| render | Доступ к аппаратному ускорению |

## Параметры

Модуль не экспонирует пользовательских опций (жёстко задан пользователь `indlns`).
