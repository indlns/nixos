# Troubleshooting

| Symptom | Quick Fix |
|---|---|
| `nixos-rebuild` fails with missing dependency | Run `nix flake check .` to identify broken imports.
| SOPS key not found | Ensure the GPG key is imported: `gpg --import <key.asc>` and registered in `.sops.yaml`.
| CI job timed out | Increase timeout in workflow or split tasks into smaller shards.

For detailed guidance, see the [Architecture](../architecture.md) and individual module READMEs.
