# LLaMA — Подробности

## Файл

`modules/system/services/ai/llama.nix`

## Конфигурация

```nix
systemd.services.llama-cpp = {
  serviceConfig = {
    WorkingDirectory = "/var/lib/llama-cpp";
    Restart = "always";
  };

  script = ''
    exec ${pkgs.llama-cpp.override { cudaSupport = true; }}/bin/llama-server \
      --api-key "$(cat ${config.sops.secrets.llama-api-key.path})" \
      --host 0.0.0.0 \
      --port 8040 \
      -m /var/lib/llama-cpp/models/qwen2.5-coder-14b-instruct.gguf \
      -ngl -1 \
      -t 16 \
      --threads-batch 16 \
      -c 65536 \
      --flash-attn auto \
      --cont-batching
  '';

  wantedBy = [ "multi-user.target" ];
};
```

## Параметры запуска

| Параметр | Значение | Описание |
|----------|----------|----------|
| WorkingDirectory | `/var/lib/llama-cpp` | Каталог для моделей |
| Restart | `always` | Перезапуск при падении |
| --host | `0.0.0.0` | Слушает на всех интерфейсах |
| --port | `8040` | Порт API |
| -m | `qwen2.5-coder-14b-instruct.gguf` | Модель |
| -ngl | `-1` | Все слои на GPU |
| -t | `16` | Потоки |
| -c | `65536` | Контекст (64K токенов) |
| --flash-attn | `auto` | Flash Attention |

## Secrets

1. Создать файл `secrets/llama-api-key.yaml`:
   ```yaml
   llama-api-key: "ваш-ключ"
   ```
2. Зашифровать: `sops -e -i secrets/llama-api-key.yaml`
3. Добавить в `secrets/common.yaml` или использовать отдельный файл

## Местоположение моделей

Модели хранятся в `/var/lib/llama-cpp/models/`. Необходимо скачать GGUF-файл и разместить его там вручную.
