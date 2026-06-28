# Модуль `system/virtualization/docker`

**Путь:** `modules/system/virtualization/docker.nix`
**Назначение:** Конфигурация Docker daemon.
**Используется хостами:** ms-02, n10-nixos

## Описание

Включает Docker с настроенным адресным пулом. На `n10-nixos` дополнительно слушает TCP 2375 для удалённого доступа.

## Настройки

```nix
virtualisation.docker = {
  enable = true;
  daemon.settings = {
    "default-address-pools" = [{ base = "172.80.0.0/16"; size = 24; }];
    "log-level" = "info";
  } // lib.optionalAttrs (hostName == "n10-nixos") {
    hosts = [
      "unix:///var/run/docker.sock"
      "tcp://0.0.0.0:2375"
    ];
  };
};
```

## Параметры

| Параметр | Значение | Описание |
|----------|----------|----------|
| `enable` | `true` | Docker включён |
| `default-address-pools` | `172.80.0.0/16` | Подсети для контейнеров |
| `log-level` | `info` | Уровень логирования |
| `hosts` (n10) | `unix + tcp://0.0.0.0:2375` | Слушает TCP для удалённого доступа |

## Заметки

- На `ms-02` Docker слушает только Unix-сокет (безопасно).
- На `n10-nixos` Docker слушает TCP 2375 (открыт для сети).
- GPU-passthrough обеспечивается модулем `hardware/dgpu.nix`.
