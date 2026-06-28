# LLaMA (LLM Server)

**Модуль:** `modules/system/services/ai/llama.nix`
**Назначение:** Сервер языковых моделей на базе llama-cpp с API-ключом.

## Быстрый старт

```nix
imports = [ ./modules/system/services/ai/llama.nix ];
```

## Опции

| Опция | Тип | По умолчанию | Описание |
|-------|-----|-------------|-----------|
| `config.sops.secrets.llama-api-key` | secret | — | API-ключ (обязательный) |

## Зависимости

- Secret: `llama-api-key` (создать в `secrets/llama-api-key.yaml`)
- Пакет: `pkgs.llama-cpp` с `cudaSupport = true`

## См. также

- [details.md](details.md) — подробная спецификация
- [Secrets Guide](../../secrets-guide.md) — как добавлять секреты
