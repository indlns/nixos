# NixOS

![](./screenshots/fastfetch.jpg)

# 🚀 Installation

## Клонируем репозиторий с flake
git clone https://app.git.indlns.ru/infrastructure/nixos
cd nixos

## Собираем и переключаем систему
sudo nixos-rebuild switch --flake .#nixos

## Собираем Home Manager
home-manager switch --flake .#indlns

## Что еще? А?