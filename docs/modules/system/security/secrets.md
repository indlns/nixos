## Пример использования
```
{ pkgs, inputs, ... }: {
  imports = [ ./services/my-service.nix ];
}
```
В `configuration.nix` включения модуля секретов не требуется – он автоматически подгружается из `hardware-configuration.nix`.
