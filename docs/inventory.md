# Инвентарь проекта

Единый справочник артефактов, модулей и хостов репозитория.

## Артефакты репозитория

| Тип | Путь | Назначение |
|-----|------|------------|
| Flake entry | `flake.nix` | Точка входа — определяет inputs и outputs |
| Flake lock | `flake.lock` | Закреплённые версии зависимостей |
| OpenCode | `opencode.json` | Конфигурация агента OpenCode |
| README | `README.md` | Общие инструкции по сборке и развёртыванию |
| Документация | `docs/` | Все документы проекта |
| Секреты | `secrets/common.yaml` | Зашифрованные SOPS-данные |
| SOPS конфиг | `secrets/.sops.yaml` | Настройки ключей шифрования |

## Модули — система

### core

| Модуль | Путь | Назначение | Подключается |
|--------|------|------------|--------------|
| nix | `modules/system/core/nix.nix` | Включает flakes, nix-ld | всеми хостами |
| nixpkgs | `modules/system/core/nixpkgs.nix` | Разрешает unfree пакеты | всеми хостами |
| packages | `modules/system/core/packages.nix` | Системные пакеты и шрифты | всеми хостами |
| users | `modules/system/core/users.nix` | Учётная запись indlns, группы, SSH-ключи | всеми хостами |
| locale | `modules/system/core/locale.nix` | Часовой пояс (Asia/Yekaterinburg), локаль ru_RU.UTF-8 | всеми хостами |
| shell | `modules/system/core/shell.nix` | Включает zsh на системном уровне | всеми хостами |
| swap | `modules/system/core/swap.nix` | 8 ГБ swap-файла | всеми хостами |
| input | `modules/system/core/input.nix` | Раскладка клавиатуры US (X11) | всеми хостами |

### networking

| Модуль | Путь | Назначение | Подключается |
|--------|------|------------|--------------|
| network | `modules/system/networking/network.nix` | Имя хоста, NetworkManager, файрвол | всеми хостами |

### hardware

| Модуль | Путь | Назначение | Подключается |
|--------|------|------------|--------------|
| graphics | `modules/system/hardware/graphics.nix` | Включает OpenGL + 32-бит | ms-02 |
| igpu | `modules/system/hardware/igpu.nix` | Intel iGPU: VAAPI, Quick Sync, OpenCL | ms-02 |
| dgpu | `modules/system/hardware/dgpu.nix` | NVIDIA: драйвер, modesetting, container toolkit, nvidia-docker | ms-02 |

### virtualization

| Модуль | Путь | Назначение | Подключается |
|--------|------|------------|--------------|
| docker | `modules/system/virtualization/docker.nix` | Docker daemon, address pool 172.80.0.0/16, TCP 2375 на n10 | ms-02, n10-nixos |

### services

| Модуль | Путь | Назначение | Подключается |
|--------|------|------------|--------------|
| pipewire | `modules/system/services/audio/pipewire.nix` | PipeWire (закомментирован, не активен) | всеми хостами |
| desktop | `modules/system/services/desktop/desktop.nix` | X11/Wayland, KDE Plasma (закомментирован) | всеми хостами |
| firefox | `modules/system/services/desktop/firefox.nix` | Firefox (закомментирован) | всеми хостами |
| input | `modules/system/services/desktop/input.nix` | Настройка ввода (закомментирован) | всеми хостами |
| nfs | `modules/system/services/network/nfs.nix` | NFS-монтирования: backups, documents, photo, nextcloud, media (192.168.10.176) | ms-02 |
| llama | `modules/system/services/ai/llama.nix` | llama-cpp сервер: порт 8040, CUDA, модель qwen2.5-coder-14b | (закомментирован) |
| ollama | `modules/system/services/ai/ollama.nix` | Ollama сервер: порт 11434, CUDA, 2 параллельных запроса | (доступен) |

### security

| Модуль | Путь | Назначение | Подключается |
|--------|------|------------|--------------|
| sops | `modules/system/security/sops.nix` | Настройки SOPS: age key, YAML-формат, путь к secrets | всеми хостами |
| secrets | `modules/system/security/secrets.nix` | Базовый модуль секретов (автоматический) | всеми хостами |
| ssh | `modules/system/security/ssh.nix` | OpenSSH: root-login=no, password=no | всеми хостами |

### maintenance

| Модуль | Путь | Назначение | Подключается |
|--------|------|------------|--------------|
| cleanup | `modules/system/maintenance/cleanup.nix` | GC: еженедельно, удалять >30 дней, auto-optimise-store | всеми хостами |
| cron | `modules/system/maintenance/cron.nix` | Включает cron | всеми хостами |

## Модули — пользователь

### common

| Модуль | Путь | Назначение | Подключается |
|--------|------|------------|--------------|
| common | `modules/user/common/default.nix` | Импортирует git и lf | всеми user-платформами |

### cli

| Модуль | Путь | Назначение | Подключается |
|--------|------|------------|--------------|
| git | `modules/user/cli/git.nix` | Git: пользователь indlns, credential store | common → все платформы |
| lf | `modules/user/cli/lf.nix` | lf: файловый менеджер, hidden, icons, drawbox, sixel | common → все платформы |
| opencode | `modules/user/cli/opencode.nix` | OpenCode CLI | linux платформа |

### shell

| Модуль | Путь | Назначение | Подключается |
|--------|------|------------|--------------|
| zsh | `modules/user/shell/zsh.nix` | Zsh: powerlevel10k, oh-my-zsh (git, sudo, extract), fastfetch при SSH | linux платформа |
| zsh-macos | `modules/user/shell/zsh-macos.nix` | Zsh: powerlevel10k, oh-my-zsh (git, sudo, extract), fastfetch интерактивно | macos платформа |
| bash | `modules/user/shell/bash.nix` | Bash: алиас `rebuild`, fastfetch при SSH | linux платформа |

### platform

| Модуль | Путь | Назначение | Подключается |
|--------|------|------------|--------------|
| macos | `modules/user/platform/macos/default.nix` | macOS: common + zsh-macos | macbook-pro, mac-mini |
| linux | `modules/user/platform/linux/default.nix` | Linux: common + opencode + zsh + bash | home/indlns.nix |

## Хосты

| Хост | Тип | Путь | Железо | Модули (доп. к default) | Сервисы |
|------|-----|------|--------|-------------------------|---------|
| ms-02 | NixOS | `hosts/ms-02/configuration.nix` | Intel Xeon E5-2680 v4, NVIDIA RTX 2080 | graphics, igpu, dgpu, nfs, docker | NFS (5 точек монтирования), Docker, SSH, printing |
| n10-nixos | NixOS | `hosts/n10-nixos/configuration.nix` | Intel Xeon E5-2620 v4, Intel iGPU (QEMU) | docker | Docker (TCP 2375), SSH, printing |
| macbook-pro | HM (macOS) | `hosts/macbook-pro/home.nix` | Apple M2 Pro | macos platform | zsh, git, lf, htop, fastfetch |
| mac-mini | HM (macOS) | `hosts/mac-mini/home.nix` | Apple M1 | macos platform | zsh, git, lf, htop, fastfetch |

## Секреты

| Файл | Назначение |
|------|------------|
| `secrets/common.yaml` | Общие секреты (API-ключи и т.д.) |
| `secrets/.sops.yaml` | Конфигурация Age-ключа для шифрования |

Используемые secret-ы в модулях:
- `config.sops.secrets.llama-api-key` — API-ключ llama-cpp сервера

## Ссылки

- [Архитектура](architecture.md) — общая схема проекта
- [Конвенции](conventions.md) — правила именования и форматирования
- [Устранение неполадок](troubleshooting.md) — типичные ошибки и исправления
