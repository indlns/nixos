# Хост `n10-nixos`

**Тип:** NixOS (виртуальная машина, QEMU)
**Железо:** Intel Xeon E5-2620 v4, Intel iGPU (виртуальная)
**Назначение:** Виртуальная машина для контейнеров и тестирования. Доступ к Docker API по TCP.

## Конфигурация

| Файл | Путь |
|------|------|
| Основной | `hosts/n10-nixos/configuration.nix` |
| Аппаратная | `hosts/n10-nixos/hardware-configuration.nix` |

## Системные настройки

- **Загрузчик:** GRUB ( `/dev/sda`, useOSProber)
- **Гостевая ОС:** QEMU Guest Agent включён
- **State version:** 25.11
- **Printing:** CUPS включён

## Подключённые модули

| Модуль | Путь | Описание |
|--------|------|----------|
| Всё из `default.nix` | `modules/system/default.nix` | Базовый набор |
| docker | `modules/system/virtualization/docker.nix` | Docker daemon с TCP 2375 |

## Сервисы

| Сервис | Порт | Описание |
|--------|------|----------|
| SSH | 22 | OpenSSH (root=no, password=no) |
| Docker | 2375 | Docker daemon (TCP, доступен извне) |
| Printing | 631 | CUPS |

## Файрвол

```
TCP: 80, 443, 32400, 2375
UDP: 42873
```

## Docker

На этом хосте Docker слушает на TCP `0.0.0.0:2375` (для удалённого доступа). Адресный пул: `172.80.0.0/16`.

## Команды развёртывания

```bash
sudo nixos-rebuild switch --flake .#n10-nixos
```
