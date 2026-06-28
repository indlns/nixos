# Unit Tests

Unit tests validate small code fragments and Nix functions.
They are located under `tests/unit/**` and run with `nix flake check . --extra-experimental-features 'nix-command flakes'`.

Run all unit tests:
```bash
nix eval .#test.unit --impure
```
