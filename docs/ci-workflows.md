# CI Workflows

## Overview
The repository is built and tested via a single GitHub Actions workflow located in `.github/workflows/ci.yml`. The key stages are:
1. **Lint** – run `deadnix`, `flake-checks`.
2. **Build** – invoke `nixos-rebuild build` for each host.
3. **Test** – run unit, integration and e2e tests via scripts in `tests/`.
4. **Artifacts** – publish built NixOS images and test reports.

Example workflow fragment:
```yaml
- name: Build system image
  run: nix build .#${{ matrix.host }}
```
See the CI config for further details.
