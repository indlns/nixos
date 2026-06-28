# Модуль `user/shell/zsh`

**Путь:** `modules/user/shell/zsh.nix`
**Назначение:** Пользовательская конфигурация Zsh (Linux).
**Используется хостами:** Linux (через platform/linux)

## Описание

Настраивает Zsh: powerlevel10k, oh-my-zsh (плагины git, sudo, extract), автодополнение, подсветка синтаксиса, fastfetch при SSH.

## Настройки

```nix
programs.zsh = {
  enable = true;
  enableCompletion = true;
  autosuggestion.enable = true;
  syntaxHighlighting.enable = true;
  oh-my-zsh.enable = true;
  oh-my-zsh.plugins = [ "git" "sudo" "extract" ];

  plugins = [{
    name = "powerlevel10k";
    src = pkgs.zsh-powerlevel10k;
    file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
  }];

  initContent = ''
    source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
    [[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
    if [[ -n "$SSH_CONNECTION" ]]; then
      fastfetch
    fi
  '';
};
```

## Экспортируемые опции Home-Manager

| Опция | Тип | По умолчанию | Описание |
|-------|-----|-------------|-----------|
| `programs.zsh.enable` | bool | `true` | Включает Zsh |
| `programs.zsh.enableCompletion` | bool | `true` | Автодополнение команд |
| `programs.zsh.autosuggestion.enable` | bool | `true` | Ghost-suggestions из истории |
| `programs.zsh.syntaxHighlighting.enable` | bool | `true` | Подсветка синтаксиса |
| `programs.zsh.oh-my-zsh.enable` | bool | `true` | Oh My Zsh |
| `programs.zsh.oh-my-zsh.plugins` | list | `["git" "sudo" "extract"]` | Плагины Oh My Zsh |
| `programs.zsh.plugins` | list | powerlevel10k | Плагины Zsh |

## Зависимости

- Пакет `zsh-powerlevel10k` (тема)
- Плагины Oh My Zsh: git, sudo, extract

## См. также

- [shell/zsh-macos](zsh-macos.md) — аналогичный модуль для macOS
- [system/core/shell](../../system/core/shell.md) — системный-level zsh
