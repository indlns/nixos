## Пример использования
```
{ pkgs, inputs, ... }: {
  imports = [ ./services/my-service.nix ];
}
```
В файле `configuration.nix` включения модуля SOPS не требуется. Путь к ключу задаётся в модулях через переменную `config.sops.age.keyFile`.

## Оставшиеся секции
- Убедитесь, что файл `secrets/common.yaml` содержит необходимые ключи.
