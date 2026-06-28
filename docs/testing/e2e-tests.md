# End‑to‑End Tests

E2E tests launch a full virtual machine using `nix flake check .#container` and run the e2e suite from `tests/e2e`. They rely on the CI matrix.

Run once locally:
```bash
nix build .#test.e2e
echo "Open test reports at ./result"
```
