# Обзор модулей

Модули — переиспользуемые Nix-фрагменты, добавляющие или изменяющие свойства системы. Разделяются на **системные** (`modules/system/`) и **пользовательские** (`modules/user/`).

## Структура

```
modules/
├── system/                    # Системные модули (NixOS)
│   ├── default.nix            # Сборщик всех системных модулей
│   ├── core/                  # Базовые: nix, locale, shell, swap, users
│   ├── networking/            # Сеть и файрвол
│   ├── hardware/              # GPU, графика
│   ├── virtualization/        # Docker
│   ├── services/              # Сервисы: AI, audio, desktop, network
│   ├── security/              # SOPS, SSH, секреты
│   └── maintenance/           # Очистка, cron
│
└── user/                      # Пользовательские модули (Home-Manager)
    ├── common/                # Общее (git, lf)
    ├── cli/                   # CLI-утилиты
    ├── shell/                 # Оболочки (zsh, bash)
    └── platform/              # Платформы (macos, linux)
```

## Системные модули

### core

| Модуль | Назначение | Хосты |
|--------|------------|-------|
| [nix](system/core/nix.md) | Flakes, nix-ld | все |
| [nixpkgs](system/core/nixpkgs.md) | Unfree пакеты | все |
| [packages](system/core/packages.md) | Пакеты и шрифты | все |
| [users](system/core/users.md) | Учётная запись indlns | все |
| [locale](system/core/locale.md) | Часовой пояс, локаль | все |
| [shell](system/core/shell.md) | Системный zsh | все |
| [swap](system/core/swap.md) | 8 ГБ swap | все |
| [input](system/core/input.md) | Раскладка клавиатуры | все |

### networking

| Модуль | Назначение | Хосты |
|--------|------------|-------|
| [network](system/networking/network.md) | Имя хоста, файрвол | все |

### hardware

| Модуль | Назначение | Хосты |
|--------|------------|-------|
| [graphics](system/hardware/graphics.md) | OpenGL + 32-бит | ms-02 |
| [igpu](system/hardware/igpu.md) | Intel iGPU | ms-02 |
| [dgpu](system/hardware/dgpu.md) | NVIDIA GPU | ms-02 |

### virtualization

| Модуль | Назначение | Хосты |
|--------|------------|-------|
| [docker](system/virtualization/docker.md) | Docker daemon | ms-02, n10-nixos |

### security

| Модуль | Назначение | Хосты |
|--------|------------|-------|
| [sops](system/security/sops.md) | SOPS конфигурация | все |
| [secrets](system/security/secrets.md) | Базовый модуль секретов | все |
| [ssh](system/security/ssh.md) | OpenSSH | все |

### maintenance

| Модуль | Назначение | Хосты |
|--------|------------|-------|
| [cleanup](system/maintenance/cleanup.md) | GC и оптимизация store | все |
| [cron](system/maintenance/cron.md) | Планировщик cron | все |

### services

| Модуль | Назначение | Хосты |
|--------|------------|-------|
| [pipewire](system/services/audio/pipewire.md) | Аудио (закомментирован) | все |
| [nfs](system/services/network/nfs.md) | NFS-монтирования | ms-02 |
| llama | llama-cpp сервер | (закомментирован) |
| ollama | Ollama API | (доступен) |

## Пользовательские модули

### common

| Модуль | Назначение | Платформы |
|--------|------------|-----------|
| [common](user/common.md) | git, lf | все |

### cli

| Модуль | Назначение | Платформы |
|--------|------------|-----------|
| [git](user/cli/git.md) | Настройки Git | все |
| [lf](user/cli/lf.md) | Файловый менеджер lf | все |
| [opencode](user/cli/opencode.md) | OpenCode CLI | linux |

### shell

| Модуль | Назначение | Платформы |
|--------|------------|-----------|
| [zsh](user/shell/zsh.md) | Zsh (powerlevel10k, oh-my-zsh) | linux |
| [zsh-macos](user/shell/zsh-macos.md) | Zsh (powerlevel10k, oh-my-zsh) | macos |
| [bash](user/shell/bash.md) | Bash (алиас rebuild) | linux |

### platform

| Модуль | Назначение | Хосты |
|--------|------------|-------|
| [macos](user/platform/macos.md) | macOS: common + zsh-macos | macbook-pro, mac-mini |
| [linux](user/platform/linux.md) | Linux: common + opencode + zsh + bash | home/indlns.nix |

## Как добавить новый модуль

См. [Архитектура → Добавление нового модуля](../architecture.md#добавление-нового-системного-модуля).
