# Integration Tests

Integration tests exercise whole modules in a sandboxed NixOS environment.
They live under `tests/integration/**` and are executed via the CI step `run-integration-tests.sh`.

To run locally:
```bash
./scripts/run-integration-tests.sh
```
