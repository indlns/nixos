# Модуль `system/default`

**Путь:** `modules/system/default.nix`
**Назначение:** Сборщик всех системных модулей. Определяет, какие модули подключаются безусловно, а какие — условно (по `hostName`).
**Используется хостами:** все NixOS-хосты (ms-02, n10-nixos)

## Описание

Файл `default.nix` — точка входа для системных модулей. Он импортирует все базовые модули (core, networking, security, services) и условно добавляет hardware-модули и специфичные сервисы для конкретных хостов.

## Структура импортов

### Безусловные (все хосты)
```nix
imports = [
  ./core/input.nix
  ./core/locale.nix
  ./core/nix.nix
  ./core/nixpkgs.nix
  ./core/packages.nix
  ./core/shell.nix
  ./core/swap.nix
  ./core/users.nix
  ./maintenance/cleanup.nix
  ./maintenance/cron.nix
  ./networking/network.nix
  ./security/secrets.nix
  ./security/sops.nix
  ./security/ssh.nix
  ./services/audio/pipewire.nix
  ./services/desktop/desktop.nix
  ./services/desktop/firefox.nix
  ./services/desktop/input.nix
]
```

### Условные (по hostName)
```nix
++ lib.optional (hostName == "ms-02") ./hardware/graphics.nix
++ lib.optional (hostName == "ms-02") ./hardware/igpu.nix
++ lib.optional (hostName == "ms-02") ./hardware/dgpu.nix
++ lib.optional (hostName == "ms-02") ./services/network/nfs.nix
++ lib.optional (hostName == "n10-nixos" || hostName == "ms-02") ./virtualization/docker.nix
```

## Параметры

| Параметр | Тип | Описание |
|----------|-----|----------|
| `hostName` | string | Имя хоста (передаётся из `flake.nix` через `specialArgs`) |

## Зависимости

- Все модули из `core/`, `networking/`, `security/`, `services/`
- `flake.nix` → `mkHost` передаёт `hostName` через `specialArgs`
