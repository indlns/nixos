# Secrets Management Guide

## Overview
Secrets are stored in `secrets/*.yaml` files and encrypted with **SOPS**. The repository keeps only the encrypted payload – plain text is never committed.

## Adding a new secret
1. Create or edit a YAML file in `secrets/` (e.g., `secrets/new.yaml`).
2. Encrypt the file:
   ```bash
   sops --encrypt secrets/new.yaml > secrets/new.yaml.sops
   rm secrets/new.yaml
   ```
3. Reference it inside a module:
   ```nix
   config.sops.secrets.mySecret.value
   ```
4. Run `nix flake check .` to verify the key exists.

## Decrypting locally
```bash
sops -d secrets/mySecret.yaml.sops > secrets/secret.txt
```
Keep decrypted files out of the repo and consider adding them to `.gitignore`.

## Key management
SOPS uses GPG or AWS KMS. Configure the chosen backend in `secrets/.sops.yaml`. Refer to the module that calls `services/sops.nix` for concrete examples.