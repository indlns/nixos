# ollama Service Details

File: `modules/system/services/ai/ollama.nix`

Description:
- Starts the `ollama-server`‑systemd unit.
- Uses `${pkgs.ollama}` binary.
- Listens on default port 11434.
- Requires API key in `config.sops.secrets.ollama-api-key.path` if authentication is enabled.
