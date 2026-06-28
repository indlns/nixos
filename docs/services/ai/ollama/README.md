# Ollama (LLM Server)

**Модуль:** `modules/system/services/ai/ollama.nix`
**Назначение:** Альтернативный сервер языковых моделей на базе Ollama.

## Быстрый старт

```nix
imports = [ ./modules/system/services/ai/ollama.nix ];
```

## Опции

| Опция | Тип | По умолчанию | Описание |
|-------|-----|-------------|-----------|
| `services.ollama.enable` | bool | `true` | Включает Ollama |
| `services.ollama.host` | string | `"0.0.0.0"` | Адрес прослушивания |
| `services.ollama.port` | int | `11434` | Порт API |

## Зависимости

- Пакет: `pkgs.ollama` с `cudaSupport = true`

## См. также

- [details.md](details.md) — подробная спецификация
