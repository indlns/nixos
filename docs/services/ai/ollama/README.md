# ollama (LLM Server Alternative)

`modules/system/services/ai/ollama.nix` provides an `ollama` systemd service.

## Quickstart
```nix
{ config, pkgs, ... }:
{
  imports = [ ./modules/system/services/ai/ollama.nix ];
}
```
