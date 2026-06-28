# Модуль `user/shell/zsh-macos`

**Путь:** `modules/user/shell/zsh-macos.nix`
**Назначение:** Пользовательская конфигурация Zsh (macOS).
**Используется хостами:** macOS (через platform/macos)

## Описание

Настраивает Zsh для macOS: powerlevel10k, oh-my-zsh (плагины git, sudo, extract), автодополнение, подсветка синтаксиса, fastfetch в интерактивном режиме.

## Настройки

```nix
programs.zsh = {
  enable = true;
  enableCompletion = true;
  autosuggestion.enable = true;
  syntaxHighlighting.enable = true;
  oh-my-zsh = {
    enable = true;
    plugins = [ "git" "sudo" "extract" ];
  };
  plugins = [{
    name = "powerlevel10k";
    src = pkgs.zsh-powerlevel10k;
    file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
  }];

  initContent = ''
    source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
    [[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
    if [[ $- == *i* ]]; then
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

## Отличия от Linux-версии

- `fastfetch` запускается в **интерактивном** режиме (`$- == *i*`), а не только при SSH.
- Нет условия `SSH_CONNECTION`.

## Зависимости

- Пакет `zsh-powerlevel10k` (тема)
- Плагины Oh My Zsh: git, sudo, extract
