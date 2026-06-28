# Модуль `system/hardware/graphics`

**Путь:** `modules/system/hardware/graphics.nix`
**Назначение:** Включение OpenGL и 32-битной поддержки графики.
**Используется хостами:** ms-02

## Описание

Включает `hardware.graphics` с поддержкой 32-битных приложений (для Steam, Wine и т.д.).

## Настройки

```nix
hardware.graphics = {
  enable = true;
  enable32Bit = true;
};
```

## Параметры

Модуль не экспонирует пользовательских опций.
