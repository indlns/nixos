# Устранение неполадок

## Типичные проблемы

| Симптом | Причина | Решение |
|---------|---------|---------|
| `nixos-rebuild` падает с `attribute missing` | Не найден модуль или пакет | `nix flake check .`, проверить пути в `imports` |
| `SOPS key not found` | Отсутствует Age-ключ или не импортирован | Проверить `~/.config/sops/age/keys.txt` |
| `attribute: 'something' was dropped` | Устаревшая ссылка на пакет | `nix flake lock --update-input nixpkgs` |
| `Permission denied` при SSH | Нет SSH-ключа в `users.nix` | Добавить ключ в `modules/system/core/users.nix` |
| Docker не стартует | Конфликт с другим сервисом | `systemctl status docker`, проверить логи |
| NFS не монтируется | Недоступен NAS | `ping 192.168.10.176`, проверить сеть |
| CI timeout | Долгая сборка | Разбить шаги, увеличить timeout |
| `home-manager switch` падает | Ошибка в Home-Manager конфиге | Проверить `hosts/<mac>/home.nix` |

## Команды отладки

```bash
# Проверка всех конфигураций
nix flake check .

# Просмотр зашифрованных секретов
sops -d secrets/common.yaml

# Обновление зависимостей
nix flake update

# Проверка конкретного хоста (без переключения)
sudo nixos-rebuild test --flake .#ms-02

# Логи systemd
journalctl -u <service-name> -f

# Проверка Docker
docker ps
systemctl status docker

# Проверка NFS-монтирований
mount | grep nfs
```

## SOPS

| Ошибка | Решение |
|--------|---------|
| `Failed to decrypt` | Проверить Age-ключ: `sops -d secrets/common.yaml` |
| `Missing key` | Добавить ключ в `.sops.yaml` или создать новый |
| `File not found` | Проверить путь в `sops.defaultSopsFile` |

## Nix

| Ошибка | Решение |
|--------|---------|
| `infinite recursion` | Проверить циклические зависимости в модулях |
| `attribute not found` | Проверить имя атрибута и версию nixpkgs |
| `building Nix` | Очистить кэш: `nix store gc` |

## Связанные документы

- [CI/CD](ci.md) — ошибки в пайплайне
- [Secrets Guide](secrets-guide.md) — проблемы с SOPS
- [Testing](testing/README.md) — запуск тестов
