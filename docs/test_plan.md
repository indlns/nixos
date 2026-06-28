# План тестов проекта NixOS flake

## Структура каталогов
| Каталог | Что находится |
|--------|----------------|
| `tests/unit` | Инспекторы конфигураций (`check-option.nix`, линейные вызовы) |
| `tests/integration` | Примерный набор серверных и клиентских сервисов (Docker, nginx, SSH), которые собираются под конкретный хост.
| `tests/e2e` | Инструментальные сценарии (shell‑тесты, `bats`, `sbt`) для проверки всей системы после деплоя.

## Запуск локально
```bash
# Unit: проверка синтаксиса опций и импортов
nix flake check .

# Integration: сборка конкретного хоста
sudo nixos-rebuild test --flake .#ms-02

# E2E: запуск сценариев тест‑фреймворка
cd tests/e2e && ./run-tests.sh
```

## CI workflow (обновленный)
1. **Lint** – `markdownlint docs/**/*.md`.
2. **Build** – `nix build .#${{ matrix.host }}` для каждого хоста.
3. **Unit tests** – автосборка и запуск `nix flake check`.
4. **Integration tests** – `nixos-rebuild test --flake .#${{ matrix.host }}` + кастомные скрипты.
5. **Artifacts** – выгрузка `.img.xz` (Nix‑image) через `actions/upload-artifact`.
6. **E2E** – после билда запускаем `tests/e2e/run-tests.sh`.

*Файл `ci.yml` обновляется в репозитории, чтобы включить вышеперечисленные шаги.*