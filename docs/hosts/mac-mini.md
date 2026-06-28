# Хост `mac-mini`

**Тип:** Home-Manager (macOS, aarch64-darwin)
**Железо:** Apple M1 (ARM)
**Назначение:** Домашний сервер / медиацентр macOS. Управление через Home-Manager.

## Конфигурация

| Файл | Путь |
|------|------|
| Home-Manager | `hosts/mac-mini/home.nix` |
| Платформа | `modules/user/platform/macos/default.nix` |

## Настройки Home-Manager

- **Пользователь:** indlns
- **Домашний каталог:** `/Users/indlns`
- **State version:** 24.05
- **POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD:** true

## Подключённые модули

| Модуль | Путь | Описание |
|--------|------|----------|
| macos | `modules/user/platform/macos/default.nix` | macOS-платформа |
| common | `modules/user/common/default.nix` | git, lf |
| zsh-macos | `modules/user/shell/zsh-macos.nix` | Zsh: powerlevel10k, oh-my-zsh |

## Установленные пакеты

| Пакет | Назначение |
|-------|------------|
| git | Система контроля версий |
| htop | Мониторинг процессов |
| fastfetch | Информация о системе |
| nerd-fonts.fira-code | Шрифт с лигатурами |

## Команды развёртывания

```bash
nix run github:nix-community/home-manager -- switch --flake .#mac-mini
# или
home-manager switch --flake .#mac-mini
```
