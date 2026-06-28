# Модуль `system/core/packages`

**Путь:** `modules/system/core/packages.nix`
**Назначение:** Системные пакеты и шрифты, устанавливаемые на все хосты.
**Используется хостами:** все NixOS-хосты

## Описание

Устанавливает базовые CLI-утилиты и набор шрифтов (включая Nerd Fonts для лигатур в оболочках).

## Устанавливаемые пакеты

| Пакет | Назначение |
|-------|------------|
| wget | Загрузка файлов |
| home-manager | Управление Home-Manager |
| nerdfetch | Информация о системе |
| lsd | Альтернатива ls |
| age | Шифрование (для SOPS) |
| sops | Управление секретами |

## Устанавливаемые шрифты

| Шрифт | Назначение |
|-------|------------|
| jetbrains-mono | Моноширинный шрифт |
| noto-fonts | Универсальные шрифты |
| noto-fonts-color-emoji | Эмодзи |
| twemoji-color-font | Twitter-эмодзи |
| font-awesome | Иконки |
| powerline-fonts | Powerline-символы |
| powerline-symbols | Powerline-символы |
| nerd-fonts.fira-code | Fira Code с лигатурами |
| nerd-fonts.droid-sans-mono | Droid Sans Mono с лигатурами |
| fira-code-symbols | Символы Fira Code |

## Параметры

Модуль не экспонирует пользовательских опций.
