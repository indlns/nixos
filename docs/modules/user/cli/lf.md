# Модуль `user/cli/lf`

**Путь:** `modules/user/cli/lf.nix`
**Назначение:** Конфигурация файлового менеджера lf.
**Используется хостами:** все (через common)

## Описание

Настраивает lf: отображение скрытых файлов, иконки, рамки, sixel-графика, превью файлов.

## Настройки

```nix
programs.lf = {
  enable = true;

  settings = {
    hidden = true;
    icons = true;
    drawbox = true;
    sixel = true;
  };

  extraConfig = ''
    set hidden
    set icons
    set drawbox
    set preview
  '';
};
```

## Экспортируемые опции Home-Manager

| Опция | Тип | По умолчанию | Описание |
|-------|-----|-------------|-----------|
| `programs.lf.enable` | bool | `true` | Включает lf |
| `programs.lf.settings.hidden` | bool | `true` | Показывать скрытые файлы |
| `programs.lf.settings.icons` | bool | `true` | Включить иконки |
| `programs.lf.settings.drawbox` | bool | `true` | Рамки around elements |
| `programs.lf.settings.sixel` | bool | `true` | Sixel-графика (терминал) |
