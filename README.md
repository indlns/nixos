# NixOS

![](./screenshots/fastfetch.jpg)

# 🧩 NixOS Flake Configuration

Модульная конфигурация NixOS + Home Manager, разделённая на system и home уровни.

---

## 📁 Структура проекта

```
.
├── flake.nix
├── flake.lock
├── hosts/
│   │── nixos/
│   │    ├── configuration.nix
│   │    └── hardware-configuration.nix
│   │
│   └── nixos-net/
│       ├── configuration.nix
│       └── hardware-configuration.nix
│
├── home/
│   └── indlns.nix
│
├── modules/
│   ├── system/
│   │   ├── core/
│   │   ├── networking/
│   │   ├── hardware/
│   │   ├── virtualization/
│   │   ├── services/
│   │   │   ├── ai/
│   │   │   ├── audio/
│   │   │   ├── desktop/
│   │   │   └── network/
│   │   ├── security/
│   │   └── maintenance/
│   │   └── default.nix
│   │
│   └── user/
│       ├── cli/
│       ├── shell/
│       └── bundle.nix
│
└── secrets/
```

---

## ⚙️ Сборка

## Клонируем репозиторий
```bash
git clone https://app.git.indlns.ru/nixos/nixos.git
cd nixos
```

### NixOS
```bash
sudo nixos-rebuild switch --flake .#nixos
```

### NixOS-net
```bash
sudo nixos-rebuild switch --flake .#nixos-net
```

---

## 🧠 Архитектура

### system/
- core системы
- сеть
- безопасность
- железо
- сервисы

### home/
- shell
- CLI
- git
- user config

---

## 🔐 Secrets
SOPS secrets:
- secrets/common.yaml
- modules/system/security/sops.nix

---

## 🖥 Hosts
- hosts/server — основная система

---

## 🚀 Идея
- модульность
- разделение system/home
- масштабируемость multi-host