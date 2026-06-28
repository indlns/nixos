# Управление секретами

## Обзор

Секреты хранятся в `secrets/*.yaml` в зашифрованном виде (SOPS + Age). Репозиторий **никогда** не содержит открытые ключи.

## Добавление нового секрета

### 1. Создать YAML-файл

```bash
# Создать временный файл
cat > secrets/new-secret.yaml << EOF
api-key: "your-secret-value"
db-password: "another-secret"
EOF
```

### 2. Зашифровать

```bash
sops -e -i secrets/new-secret.yaml
```

### 3. Проверить `.sops.yaml`

Убедиться, что `secrets/.sops.yaml` содержит нужный Age-ключ:

```yaml
keys:
  - &nixos age1d73872whjx90xl6y5ez04dfk7uvkf4ztz07skcd5qffzhppu9eqs07xnvn
creation_rules:
  - path_regex: .*\.yaml$
    key_groups:
      - age:
          - *nixos
```

### 4. Использовать в модуле

```nix
# В модуле
{ config, ... }: {
  services.my-service = {
    api-key = config.sops.secrets.my-secret.path;
  };
}
```

## Расшифровка локально

```bash
# Просмотр зашифрованного файла
sops -d secrets/common.yaml

# Расшифровать в файл (НЕ коммитить!)
sops -d secrets/my-secret.yaml > /tmp/secret.txt
```

## Настройка Age-ключа

### Генерация нового ключа

```bash
# Генерация Age-ключа
age-keygen -o ~/.config/sops/age/keys.txt
```

### Импорт существующего ключа

```bash
# Ключ уже должен быть по пути, указанному в sops.nix:
# sops.age.keyFile = "/home/indlns/.config/sops/age/keys.txt";
```

## Проверка

```bash
# Проверить, что все секреты доступны
nix flake check .
```

## Связанные документы

- [security/sops](modules/system/security/sops.md) — настройки SOPS
- [Troubleshooting](troubleshooting.md) — ошибки SOPS
