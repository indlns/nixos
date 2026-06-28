# Сервис Network (NFS)

**Модуль:** `modules/system/services/network/nfs.nix`
**Назначение:** NFS-монтирования с NAS-сервера.

## Точки монтирования

| Путь | Адрес NAS | Назначение |
|------|-----------|------------|
| `/mnt/nas/backups` | 192.168.10.176:/mnt/data/backups | Резервные копии |
| `/mnt/nas/documents` | 192.168.10.176:/mnt/data/documents | Документы |
| `/mnt/nas/photo` | 192.168.10.176:/mnt/data/photo | Фотографии |
| `/mnt/nas/nextcloud` | 192.168.10.176:/mnt/data/nextcloud | Nextcloud |
| `/mnt/nas/media` | 192.168.10.176:/mnt/media/media | Медиа |

## Подключается к

- **ms-02** (условно, `hostName == "ms-02"`)

Подробнее: [nfs.md](../../modules/system/services/network/nfs.md)
