# Модуль `system/security/sops`

**Путь:** `modules/system/security/sops.nix`
**Назначение:** Конфигурация SOPS для шифрования секретов.
**Используется хостами:** все NixOS-хосты

## Описание

Настраивает SOPS: формат YAML, путь к Age-ключу, дефолтный файл секретов.

## Настройки

```nix
sops.defaultSopsFile = ../../../secrets/common.yaml;
sops.age.keyFile = "/home/indlns/.config/sops/age/keys.txt";
sops.defaultSopsFormat = "yaml";
sops.age.sshKeyPaths = [];
sops.age.generateKey = false;
```

## Параметры

| Параметр | Значение | Описание |
|----------|----------|----------|
| `defaultSopsFile` | `../../../secrets/common.yaml` | Дефолтный зашифрованный файл |
| `age.keyFile` | `/home/indlns/.config/sops/age/keys.txt` | Путь к Age-ключу |
| `defaultSopsFormat` | `yaml` | Формат секретов |
| `age.sshKeyPaths` | `[]` | SSH-ключи не используются для расшифровки |
| `age.generateKey` | `false` | Автогенерация ключа отключена |

## Зависимости

- Требует Age-ключа по указанному пути
- Секреты хранятся в `secrets/common.yaml`

## См. также

- [Secrets Guide](../../secrets-guide.md) — как добавлять и использовать секреты
