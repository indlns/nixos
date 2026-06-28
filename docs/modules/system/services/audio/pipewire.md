# Модуль `system/services/audio/pipewire`

**Путь:** `modules/system/services/audio/pipewire.nix`
**Назначение:** Конфигурация PipeWire (аудио).
**Используется хостами:** все NixOS-хосты

## Описание

Модуль содержит настройки PipeWire, но на данный момент **закомментирован** — аудио-стек не активен.

## Текущее состояние

Весь код закомментирован:
```nix
# services.pulseaudio.enable = false;
# security.rtkit.enable = true;
# services.pipewire = {
#   enable = true;
#   alsa.enable = true;
#   alsa.support32Bit = true;
#   pulse.enable = true;
# };
```

## Параметры

Модуль не экспонирует пользовательских опций. Все настройки захардкожены (закомментированы).

## Заметки

Для включения аудио необходимо раскомментировать соответствующие строки в `pipewire.nix`.
