# Модуль `system/services/network/nfs`

**Путь:** `modules/system/services/network/nfs.nix`
**Назначение:** NFS-монтирования с NAS-сервера.
**Используется хостами:** ms-02

## Описание

Монтирует 5 каталогов с NAS-сервера `192.168.10.176` по NFS. Все точки монтирования доступны в `/mnt/nas/`.

## Точки монтирования

| Путь | Адрес NAS | Опции |
|------|-----------|-------|
| `/mnt/nas/backups` | `192.168.10.176:/mnt/data/backups` | auto, nofail, noatime, nolock, intr, tcp |
| `/mnt/nas/documents` | `192.168.10.176:/mnt/data/documents` | auto, nofail, noatime, nolock, intr, tcp |
| `/mnt/nas/photo` | `192.168.10.176:/mnt/data/photo` | auto, nofail, noatime, nolock, intr, tcp |
| `/mnt/nas/nextcloud` | `192.168.10.176:/mnt/data/nextcloud` | auto, nofail, noatime, nolock, intr, tcp |
| `/mnt/nas/media` | `192.168.10.176:/mnt/media/media` | auto, nofail, noatime, nolock, intr, tcp |

## Опции монтирования

| Опция | Описание |
|-------|----------|
| `auto` | Монтирование при загрузке |
| `nofail` | Не блокировать загрузку при недоступности |
| `noatime` | Не обновлять timestamp доступа |
| `nolock` | Отключить файловые блокировки |
| `intr` | Прерываемые операции ввода-вывода |
| `tcp` | Использовать TCP |

## Параметры

Модуль не экспонирует пользовательских опций. Все пути захардкожены.

## Заметки

- Подключается условно: только для `hostName == "ms-02"`.
- Требует доступа к NAS по сети (192.168.10.176).
