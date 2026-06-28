# Project Conventions

## File layout
- **`flake.nix`** – Top‑level entry point.
- **Modules** – Small, composable files under `modules/**`.
- **Hosts** – One directory per machine, each with a `configuration.nix`.
- **Secrets** – Encrypted YAMLs in `secrets/`.

## Naming
- Use PascalCase for module names like `Networking.nix`? Actually repository uses snake_case (e.g., `networking.nix`). Follow that.
- Paths are *relative* to the root; avoid absolute references in modules.

## Documentation
Documentation lives under `docs/`. Keep each file short and link cross‑references using relative paths.
