# План рефакторинга документации

> Дата: 2026-06-28
> Статус: Завершён (v1)
> Автор: Build Agent

---

## 1. Контекст и мотивация

Документация проекта `nixos` перед рефакторингом содержала ~50 файлов, из которых:
- **30+ были пустышками** — шаблоны с `(текст описания модуля)` без реального содержимого
- **~50/50 язык** — английский и русский вперемешку, без единого стандарта
- **6 дублирующих файлов** — CI, inventory, test_plan
- **2 сломанных файла** — sops.md и secrets.md потеряли заголовки
- **Выдуманные опции** — shell модули описывали несуществующие параметры (dotfiles, aliases, pathAdd)

Цель — единая, единообразная, полная документация на русском языке с реальными данными из исходного кода.

---

## 2. Принятые решения

| Решение | Обоснование |
|---------|-------------|
| Единый язык: **русский** | Соответствует `AGENTS.md` Language Policy. Английский только в коде и терминах. |
| Единый шаблон для каждого типа файла | Гарантирует консистентность: заголовок, путь, назначение, описание, таблица опций, пример, зависимости |
| Объединение дублей | Один файл = одно назначение. CI → `ci.md`, inventory → `inventory.md`, testing → `testing/README.md` |
| Заполнение по реальному коду | Каждый модуль документируется по его `.nix` файлу, без выдумывания опций |
| Mermaid для диаграмм | Поддерживается GitHub, визуализирует зависимости |
| Удаление мусора | `__placeholder__.md`, внутренние планы, пустышки — не несут ценности |

---

## 3. Структура до и после

### До (проблемная)

```
docs/
├── architecture.md              ✅ хороший
├── conventions.md               ⚠️ 17 строк, смешанный язык
├── inventory.md                 ⚠️ дублирует inventory_services.md
├── inventory_services.md        ❌ дубликат
├── inventory_functions.md       ❌ пустышка
├── inventory_services_update.md ❌ пустышка
├── secrets-guide.md             ✅ неплохой
├── troubleshooting.md           ⚠️ 20 строк
├── ci-workflows.md              ⚠️ 15 строк, устаревший
├── ci_workflow_instructions.md  ⚠️ дубликат ci-workflows
├── test_plan.md                 ⚠️ дубликат testing/
├── modules_overview.md          ❌ 2 строки, пустышка
├── doc_update_workflow.md       ❌ внутренний план с дедлайнами
├── testing/
│   ├── unit-tests.md            ⚠️ 9 строк
│   ├── integration-tests.md     ⚠️ 9 строк
│   └── e2e-tests.md             ⚠️ 9 строк
├── hosts/
│   ├── instructions.md          ⚠️ заменён на README.md
│   ├── ms-02.md                 ❌ пустышка
│   ├── n10-nixos.md             ❌ пустышка
│   ├── macbook-pro.md           ❌ пустышка
│   └── mac-mini.md              ❌ пустышка
├── services/
│   ├── overview.md              ⚠️ дубликат README
│   ├── __placeholder__.md       ❌ мусор
│   └── ...details.md            ❌ пустышки (5 штук)
├── modules/
│   ├── system/**/*.md (20)      ❌ все пустышки, 2 сломаны
│   └── user/**/*.md (8)         ❌ 5 пустышек, 3 с выдуманными опциями
```

### После (чистая)

```
docs/
├── architecture.md              ✅ mkHost, inputs, Mermaid, дерево модулей
├── conventions.md               ✅ единый язык, шаблоны, формат таблиц
├── inventory.md                 ✅ единый справочник (артефакты + модули + хосты)
├── secrets-guide.md             ✅ пошаговое добавление секретов, Age-ключи
├── troubleshooting.md           ✅ расширенная таблица + команды отладки
├── ci.md                        ✅ объединённый CI/CD
├── modules/
│   ├── README.md                ✅ обзор модулей с деревом
│   ├── system/**/*.md (20)      ✅ все заполнены по реальному коду
│   └── user/**/*.md (8)         ✅ реальные опции из Home-Manager
├── hosts/
│   ├── README.md                ✅ обзор хостов
│   ├── ms-02.md                 ✅ железо, модули, NFS, команды
│   ├── n10-nixos.md             ✅ железо, Docker TCP, команды
│   ├── macbook-pro.md           ✅ HM конфигурация
│   └── mac-mini.md              ✅ HM конфигурация
├── services/
│   ├── README.md                ✅ обзор сервисов
│   ├── ai/                      ✅ LLaMA + Ollama (README + details)
│   ├── audio/README.md          ✅
│   ├── desktop/README.md        ✅
│   └── network/README.md        ✅
└── testing/
    └── README.md                ✅ типы тестов, команды запуска
```

---

## 4. Детальный план работ (для повторения)

### Этап 1: Очистка
- [x] Удалить `services/__placeholder__.md`
- [x] Удалить `doc_update_workflow.md`
- [x] Удалить `inventory_functions.md`
- [x] Удалить `inventory_services_update.md`
- [x] Удалить `inventory_services.md` (дубликат)
- [x] Удалить `modules_overview.md` (пустышка)
- [x] Удалить `ci-workflows.md` (устаревший)
- [x] Удалить `ci_workflow_instructions.md` (дубликат)
- [x] Удалить `test_plan.md` (дубликат)
- [x] Удалить `services/*/details.md` (пустышки)
- [x] Удалить `hosts/instructions.md` (заменён)
- [x] Переименовать `services/overview.md` → `services/README.md`
- [x] Удалить пустые подкаталоги `services/desktop/{desktop,input,firefox}/`

### Этап 2: Конвенции
- [x] Переписать `conventions.md` на единый русский язык
- [x] Добавить шаблоны: модуль, сервис, хост
- [x] Определить формат таблиц, Mermaid, проверки

### Этап 3: Архитектура
- [x] Исправить ошибку в коде (строка 51)
- [x] Описать `mkHost` с полным кодом
- [x] Описать inputs (nixpkgs, home-manager, sops-nix)
- [x] Добавить Mermaid-диаграмму зависимостей
- [x] Добавить дерево системных модулей

### Этап 4: Inventory
- [x] Объединить все inventory-файлы в один `inventory.md`
- [x] Включить: артефакты, модули system/user, хосты, сервисы, секреты

### Этап 5: Hosts
- [x] Заполнить `ms-02.md`: Intel Xeon, NVIDIA, NFS, Docker
- [x] Заполнить `n10-nixos.md`: QEMU, Docker TCP 2375
- [x] Заполнить `macbook-pro.md`: M2 Pro, Home-Manager
- [x] Заполнить `mac-mini.md`: M1, Home-Manager
- [x] Создать `hosts/README.md` — обзор хостов

### Этап 6: Модули system (20 файлов)
- [x] `default.md` — сборщик модулей
- [x] `core/nix.md` — flakes, nix-ld
- [x] `core/nixpkgs.md` — allowUnfree
- [x] `core/packages.md` — пакеты и шрифты
- [x] `core/users.md` — учётная запись indlns
- [x] `core/locale.md` — Asia/Yekaterinburg, ru_RU.UTF-8
- [x] `core/shell.md` — системный zsh
- [x] `core/swap.md` — 8 ГБ swap
- [x] `core/input.md` — раскладка US
- [x] `hardware/graphics.md` — OpenGL + 32-бит
- [x] `hardware/igpu.md` — Intel iGPU, VAAPI
- [x] `hardware/dgpu.md` — NVIDIA, container toolkit
- [x] `networking/network.md` — файрвол, порты
- [x] `security/sops.md` — SOPS, Age
- [x] `security/secrets.md` — базовый модуль
- [x] `security/ssh.md` — OpenSSH
- [x] `virtualization/docker.md` — Docker daemon
- [x] `maintenance/cleanup.md` — GC, auto-optimise
- [x] `maintenance/cron.md` — cron
- [x] `services/audio/pipewire.md` — PipeWire (закомментирован)
- [x] `services/network/nfs.md` — NFS монтирования

### Этап 7: Модули user (8 файлов)
- [x] `common.md` — импорт git + lf
- [x] `shell/zsh.md` — реальные опции: powerlevel10k, oh-my-zsh
- [x] `shell/zsh-macos.md` — аналогично, fastfetch интерактивно
- [x] `shell/bash.md` — алиас rebuild, fastfetch при SSH
- [x] `cli/git.md` — пользователь, email, credential store
- [x] `cli/lf.md` — hidden, icons, drawbox, sixel
- [x] `cli/opencode.md` — пакет opencode
- [x] `platform/macos.md` — common + zsh-macos
- [x] `platform/linux.md` — common + opencode + zsh + bash

### Этап 8: Services
- [x] `services/README.md` — обзор с таблицей
- [x] `services/ai/README.md` — LLaMA + Ollama
- [x] `services/ai/llama/README.md` + `details.md` — полная спецификация
- [x] `services/ai/ollama/README.md` + `details.md` — полная спецификация
- [x] `services/audio/README.md` — PipeWire
- [x] `services/desktop/README.md` — Desktop
- [x] `services/network/README.md` — NFS

### Этап 9: CI
- [x] Создать `ci.md` — этапы, матрица, локальный запуск

### Этап 10: Testing
- [x] Создать `testing/README.md` — unit/integration/e2e

### Этап 11: Secrets
- [x] Переписать `secrets-guide.md` — пошаговое добавление, Age-ключи

### Этап 12: Troubleshooting
- [x] Расширить `troubleshooting.md` — таблица + команды отладки

### Этап 13: Обзор модулей
- [x] Создать `modules/README.md` — дерево модулей с ссылками

### Этап 14: Финальная проверка
- [x] Удалить дубликат `test_plan.md`
- [x] Удалить пустые подкаталоги
- [x] Проверить количество файлов (52)

---

## 5. Шаблоны документации

### Шаблон модуля

```markdown
# Модуль `<category>/<name>`

**Путь:** `modules/<category>/<name>.nix`
**Назначение:** <одно предложение>
**Используется хостами:** <список или «все»>

## Описание
<2–4 предложения>

## Настройки
```nix
<реальный код из .nix файла>
```

## Параметры
| Параметр | Значение | Описание |
|----------|----------|----------|

## Параметры
Модуль не экспонирует пользовательских опций.

## См. также
- Ссылки на связанные документы
```

### Шаблон сервиса

```markdown
# <Имя сервиса>

**Модуль:** `modules/system/services/<category>/<name>.nix`
**Назначение:** <одно предложение>

## Быстрый старт
```nix
imports = [ ./modules/system/services/<category>/<name>.nix ];
```

## Опции
| Опция | Тип | По умолчанию | Описание |
|-------|-----|-------------|-----------|

## Зависимости
- Secret'ы: ...
- Другие сервисы: ...
```

### Шаблон хоста

```markdown
# Хост `<name>`

**Тип:** NixOS / Home-Manager (macOS)
**Железо:** <CPU, GPU, диск, сеть>
**Назначение:** <одно предложение>

## Конфигурация
| Файл | Путь |
|------|------|

## Подключённые модули
| Модуль | Описание |
|--------|----------|

## Сервисы
| Сервис | Порт | Описание |
|--------|------|----------|

## Команды развёртывания
```bash
sudo nixos-rebuild switch --flake .#<name>
```
```

---

## 6. Проверка качества

### Что проверять после изменений

| Проверка | Команда |
|----------|---------|
| Все ссылки существуют | `grep -roh '\[.*\](.*\.md)' docs/ \| sort -u` |
| Нет пустых файлов | `find docs/ -name "*.md" -empty` |
| Mermaid рендерится | Просмотр в GitHub Preview |
| Единый язык | `grep -rl "Description:" docs/` (должно быть 0) |
| Нет выдуманных опций | Сверка таблиц опций с реальным кодом .nix |

### Типичные ошибки при обновлении

| Ошибка | Как исправить |
|--------|---------------|
| Забыл обновить `inventory.md` | Добавить новый модуль/хост/сервис в таблицу |
| Сломал ссылку | Проверить относительный путь |
| Добавил на английском | Перевести на русский |
| Описал несуществующую опцию | Сверить с `.nix` файлом |

---

## 7. Будущие итерации

### Приоритет 1 (средний)
- [ ] Создать `.github/workflows/ci.yml` (сейчас описан, но отсутствует)
- [ ] Добавить `markdownlint` в CI для проверки форматирования
- [ ] Обновить корневой `README.md` со ссылками на новую документацию

### Приоритет 2 (низкий)
- [ ] Добавить Mermaid-диаграмму для каждого хоста (Hardware → Modules → Services)
- [ ] Создать `docs/glossary.md` — глоссарий терминов (NixOS, flake, module, derivation)
- [ ] Автоматизировать генерацию `inventory.md` из исходного кода (скрипт)

### Приоритет 3 (низкий)
- [ ] Добавить примеры реальных конфигураций (не только шаблоны)
- [ ] Документировать `home/indlns.nix` подробнее
- [ ] Создать `docs/faq.md` — часто задаваемые вопросы

---

## 8. Метрики успеха

| Метрика | Цель |
|---------|------|
| Процент заполненных файлов | 100% (было ~40%) |
| Язык документации | 100% RU (было ~50/50) |
| Количество дублей | 0 (было 6) |
| Количество пустышек | 0 (было 30+) |
| Покрытие модулей | 100% (все .nix файлы задокументированы) |
| Mermaid-диаграммы | 3+ (architecture, hosts, modules) |

---

## 9. Контакты и ответственные

| Этап | Ответственный | Срок |
|------|---------------|------|
| Очистка | Build Agent | 2026-06-28 |
| Конвенции | Build Agent | 2026-06-28 |
| Архитектура | Build Agent | 2026-06-28 |
| Модули | Build Agent | 2026-06-28 |
| Services | Build Agent | 2026-06-28 |
| CI/Testing | Build Agent | 2026-06-28 |
| Финальная проверка | Build Agent | 2026-06-28 |

---

*Этот документ предназначен для повторения процесса рефакторинга документации в будущих итерациях проекта.*
