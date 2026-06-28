# Инструкция по развертыванию CI Pipeline

> **Требуется** обновление файла `.github/workflows/ci.yml`, но для чтения документации мы оставляем его в `docs`.

## Шаги добавления нового хоста к пайплайну
1. Перейти в файл `.github/workflows/ci.yml`.  
2. В секцию `matrix.hosts` добавить имя нового флейка (`my-new-host`).   
3. Обновить тесты: включить папку `tests/integration/my-new-host/**`, если понадобится специфический скрипт.
4. Выполнить локальный билд чтобы убедиться, что все опции заданы.

```bash
# локальное тестирование (обязательно)
sudo nixos-rebuild test --flake .#my-new-host
# запуск CI вручную
git add .github/workflows/ci.yml && git commit -m "Add my-new-host" && git push
```

## Структура файла `ci.yml`
```yaml
description: Continuous Integration for NixOS flake
name: CI

on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]

jobs:
  lint-and-build:
    runs-on: ubuntu-latest
    strategy:
      matrix:
        host: [ ms-02, n10-nixos, macbook-pro, mac-mini ]
    steps:
      - uses: actions/checkout@v4
      - name: Checkout flake
        run: nix develop --command echo "Hello"
      - name: Markdown lint
        run: markdownlint docs/**/*.md
      - name: Build image
        run: nix build .#${{ matrix.host }}
      # … остальные шаги, как в test_plan.md
```

## Проверка логов CI
Логи находятся по адресу:
`https://github.com/<org>/<repo>/actions/runs/<run-id>`.
Если билд падает – проверяем шаг `Build image`, обычно ошибки из‑за недостающих опций или конфликтов SOPS.
