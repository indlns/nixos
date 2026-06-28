# Модуль `user/shell/zsh-macos`

**Путь:** `modules/user/shell/zsh-macos.nix` 
**Назначение:** Конфигурация zsh для macOS.

## Описание
(текст описания модуля)

## Опции
| Параметр | Тип | По умолчанию | Описание |
|----------|-----|--------------|-----------|
| `ohMyZsh` | bool | true | Установка и настройка Oh‑My‑Zsh. |
| `theme` | string | "agnoster" | Тема зш-шлюзов (поддерживает oh-my-zsh). |
| `plugins` | list of strings | [] | Список Oh‑My‑Zsh плагинов, которые автоматически подключаются. |

### Пример использования
```
{ pkgs, ... }: {
  imports = [ ./user/shell/zsh-macos.nix ];
}
```