# Обзор хостов

Репозиторий содержит четыре хоста: два NixOS и два Home-Manager (macOS).

| Хост | Тип | Железо | Назначение | Документация |
|------|-----|--------|------------|--------------|
| ms-02 | NixOS | Intel Xeon E5-2680 v4, NVIDIA RTX 2080 | Основной сервер: NFS, Docker, AI | [ms-02.md](ms-02.md) |
| n10-nixos | NixOS (QEMU) | Intel Xeon E5-2620 v4 | Виртуальная машина: Docker API | [n10-nixos.md](n10-nixos.md) |
| macbook-pro | HM (macOS) | Apple M2 Pro | Портативная рабочая станция | [macbook-pro.md](macbook-pro.md) |
| mac-mini | HM (macOS) | Apple M1 | Домашний сервер | [mac-mini.md](mac-mini.md) |

## Структура конфигурации

Каждый NixOS-хост:
- `hosts/<host>/configuration.nix` — основные настройки
- `hosts/<host>/hardware-configuration.nix` — аппаратная (не редактируется!)

Каждый macOS-хост:
- `hosts/<host>/home.nix` — Home-Manager конфигурация

## Добавление нового хоста

См. [Архитектура → Добавление нового хоста](../architecture.md#добавление-нового-хоста).
