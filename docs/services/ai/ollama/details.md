# Ollama — Подробности

## Файл

`modules/system/services/ai/ollama.nix`

## Конфигурация

```nix
let
  ollama-cuda = pkgs.ollama.override { cudaSupport = true; };
in
{
  services.ollama = {
    enable = true;
    host = "0.0.0.0";
    port = 11434;
    package = ollama-cuda;
    environmentVariables = {
      OLLAMA_ORIGINS = "*";
      OLLAMA_HOST = "0.0.0.0:11434";
      OLLAMA_NUM_PARALLEL = "2";
      OLLAMA_NUM_THREADS = "10";
      OLLAMA_FLASH_ATTENTION = "1";
      OLLAMA_KEEP_ALIVE = "10m";
    };
  };
}
```

## Параметры

| Параметр | Значение | Описание |
|----------|----------|----------|
| enable | `true` | Включает Ollama |
| host | `"0.0.0.0"` | Слушает на всех интерфейсах |
| port | `11434` | Порт API |
| package | ollama-cuda | Версия с поддержкой CUDA |

## Переменные окружения

| Переменная | Значение | Описание |
|------------|----------|----------|
| OLLAMA_ORIGINS | `*` | Разрешить все origins |
| OLLAMA_HOST | `0.0.0.0:11434` | Адрес и порт |
| OLLAMA_NUM_PARALLEL | `2` | Макс. параллельных запросов |
| OLLAMA_NUM_THREADS | `10` | Количество потоков |
| OLLAMA_FLASH_ATTENTION | `1` | Flash Attention |
| OLLAMA_KEEP_ALIVE | `10m` | Время жизни модели в памяти |

## Использование

```bash
# Загрузка модели
ollama pull qwen2.5-coder:14b

# Запрос
curl http://localhost:11434/api/generate -d '{"model": "qwen2.5-coder:14b", "prompt": "Hello"}'
```
