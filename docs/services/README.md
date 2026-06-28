# Сервисы проекта

Системные сервисы упакованы в NixOS-модули и находятся в `modules/system/services/`.

## Обзор сервисов

| Сервис | Путь модуля | Порт | Описание | Подключается |
|--------|-------------|------|----------|--------------|
| PipeWire | `services/audio/pipewire.nix` | — | Аудио (закомментирован) | все хосты |
| Desktop | `services/desktop/desktop.nix` | — | X11/Wayland (закомментирован) | все хосты |
| Firefox | `services/desktop/firefox.nix` | — | Браузер (закомментирован) | все хосты |
| Input | `services/desktop/input.nix` | — | Ввод (закомментирован) | все хосты |
| NFS | `services/network/nfs.nix` | — | NFS-монтирования с NAS | ms-02 |
| LLaMA | `services/ai/llama.nix` | 8040 | llama-cpp сервер | (закомментирован) |
| Ollama | `services/ai/ollama.nix` | 11434 | Ollama API | (доступен) |

## Структура документации

```
docs/services/
├── README.md              # Этот файл
├── ai/
│   ├── llama/
│   │   ├── README.md      # Быстрый старт
│   │   └── details.md     # Подробная спецификация
│   └── ollama/
│       ├── README.md
│       └── details.md
├── audio/
│   └── README.md
├── desktop/
│   └── README.md
└── network/
    └── README.md
```

## Добавление нового сервиса

1. Создать модуль: `modules/system/services/<категория>/<имя>.nix`
2. Создать документацию: `docs/services/<категория>/<имя>/README.md` + `details.md`
3. Добавить импорт в `modules/system/default.nix` (безусловно или условно)
4. Обновить эту таблицу
