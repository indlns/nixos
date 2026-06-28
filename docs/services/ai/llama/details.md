# llama Service Details

### File Location
`modules/system/services/ai/llama.nix`

### Configuration Parameters
- **WorkingDirectory** – `/var/lib/llama-cpp` (store models here).
- **Restart** – `always`.
- **Command** – Uses `${pkgs.llama-cpp.override { cudaSupport = true; }}/bin/llama-server`.
- **Options**
  - `--api-key` reads from SOPS secret.
  - `--host`, `--port`, `-m`, etc. are hard‑coded but can be overridden by passing environment variables into the module.

### Secrets Flow
1. Place your key in `secrets/llama-api-key.yaml`.
2. Encrypt with SOPS; keep `.sops.yaml` configured.
3. Reference via `${config.sops.secrets.llama-api-key.path}`.
