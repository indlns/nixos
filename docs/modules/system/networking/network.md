# Модуль `system/networking/network`

**Путь:** `modules/system/networking/network.nix`
**Назначение:** Сетевые настройки: имя хоста, NetworkManager, файрвол.
**Используется хостами:** все NixOS-хосты

## Описание

Настраивает имя хоста, включает NetworkManager и файрвол с разрешёнными портами.

## Настройки

```nix
networking.hostName = hostName;
networking.networkmanager.enable = true;

networking.firewall = {
  allowedTCPPorts = [ 80 443 32400 ]
    ++ lib.optionals (hostName == "ms-02") [ 9100 ]
    ++ lib.optionals (hostName == "n10-nixos") [ 2375 ];
  allowedUDPPorts = [ 42873 ];
  enable = hostName != "ms-02";
};
```

## Параметры

| Параметр | Тип | Описание |
|----------|-----|----------|
| `hostName` | string | Имя хоста (передаётся из `flake.nix`) |

## Порты

| Протокол | Порт | Хосты | Назначение |
|----------|------|-------|------------|
| TCP | 80 | все | HTTP |
| TCP | 443 | все | HTTPS |
| TCP | 32400 | все | Plex |
| TCP | 9100 | ms-02 | Prometheus Node Exporter |
| TCP | 2375 | n10-nixos | Docker API |
| UDP | 42873 | все | — |

## Файрвол

- На `ms-02` файрвол **отключён** (`enable = false`).
- На `n10-nixos` файрвол **включён** с разрешёнными портами.
