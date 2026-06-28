# Модуль `system/maintenance/cleanup`

**Путь:** `modules/system/maintenance/cleanup.nix`
**Назначение:** Автоматическая очистка Nix store.
**Используется хостами:** все NixOS-хосты

## Описание

Включает автоматическую оптимизацию Nix store и еженедельный garbage collection (удаление пакетов старше 30 дней).

## Настройки

```nix
nix.settings.auto-optimise-store = true;

nix.gc = {
  automatic = true;
  dates = "weekly";
  options = "--delete-older-than 30d";
};
```

## Параметры

| Параметр | Значение | Описание |
|----------|----------|----------|
| `auto-optimise-store` | `true` | Автоматическая оптимизация hardlinks |
| `gc.automatic` | `true` | Автоматический GC |
| `gc.dates` | `"weekly"` | Расписание (еженедельно) |
| `gc.options` | `"--delete-older-than 30d"` | Удалять поколения старше 30 дней |
