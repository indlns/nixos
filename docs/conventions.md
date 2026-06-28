# Project Conventions

## File layout
- **`flake.nix`** – Top‑level entry point.
- **Modules** – Small, composable files under `modules/**`.
- **Hosts** – One directory per machine, each with a `configuration.nix`.
- **Secrets** – Encrypted YAMLs in `secrets/`.

## Naming
- Use PascalCase for module names like `Networking.nix`? Actually repository uses snake_case (e.g., `networking.nix`). Follow that.
- Paths are *relative* to the root; avoid absolute references in modules.

## Документация
- Сохраняется в каталоге `docs/`.
- Каждый файл должен быть кратким, но содержать таблицы и ссылки на другие разделы. 
- Используйте относительные пути (`../hosts/macbook-pro.md`).
- Для Markdown‑тегов поддерживается «Mermaid» и «PlantUML» (проверка линта через `markdownlint`).
