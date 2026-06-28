# llama (LLM Server)

The **llama** service provides a language‑model API using `llama-cpp`. The Nix module is defined in `modules/system/services/ai/llama.nix`.

## Key Options
| Option | Default | Description |
|---|---|---|
| `config.sops.secrets.llama-api-key` | required | API key for the model service. Store it encrypted in `secrets/`. |
| `pkgs.llama-cpp.cudaSupport` | `true` | Enable CUDA acceleration when available. |

## Usage example
```nix
{ pkgs, config, ... }:
{
  imports = [ ./modules/system/services/ai/llama.nix ];
}
```
