# Project Inventory
 
A quick reference of key artefacts in the repository.
 
| Type | Path | Purpose |
|---|---|---|
| Flake entry | `flake.nix` | Bootstraps system & Home‑Manager configurations.
| Host configs | `hosts/**/configuration.nix` | Machine‑specific options.
| System modules | `modules/system/**` | Reusable NixOS fragments.
| User modules | `home/**`, `modules/user/**` | Shared user profile logic.
| Secrets | `secrets/*.yaml` | Encrypted data, accessed via sops‑nix.

# New Documentation Artifacts

## Modules
| Module | Path | Purpose |
|---|---|---|
| User‑Platform MacOS | `modules/user/platform/macos/default.nix` | Default configuration for macOS users.
| User‑Platform Linux | `modules/user/platform/linux/default.nix` | Default configuration for Linux users.
| User Common | `modules/user/common/default.nix` | Shared user settings across platforms.
| User Shell Zsh MacOS | `modules/user/shell/zsh-macos.nix` | Zsh configuration tailored to macOS.
| User CLI Opencode | `modules/user/cli/opencode.nix` | Command‑line utilities for OpenCode.
| User CLI LF | `modules/user/cli/lf.nix` | File manager configurations using lf.
| User Shell Zsh | `modules/user/shell/zsh.nix` | Default Zsh shell settings.
| User Shell Bash | `modules/user/shell/bash.nix` | Default Bash shell settings.
| User CLI Git | `modules/user/cli/git.nix` | Git helper utilities.
| System Core Nix | `modules/system/core/nix.nix` | Nix package manager configuration.
| System Hardware DGPU | `modules/system/hardware/dgpu.nix` | NVIDIA GPU support module.
| System Virtualization Docker | `modules/system/virtualization/docker.nix` | Docker daemon configuration.
| System Services AI Llama | `modules/system/services/ai/llama.nix` | LLaMA‑CPP server setup.
| System Services AI Ollama | `modules/system/services/ai/ollama.nix` | Ollama API server configuration.
| System Networking Network | `modules/system/networking/network.nix` | Core networking options.
| System Core Packages | `modules/system/core/packages.nix` | Package list for system profiles.
| System Core Users | `modules/system/core/users.nix` | User account settings.
| System Maintenance Cleanup | `modules/system/maintenance/cleanup.nix` | Garbage‑collection and cleanup tasks.
| System Hardware Graphics | `modules/system/hardware/graphics.nix` | Generic graphics driver setup.
| System Hardware iGPU | `modules/system/hardware/igpu.nix` | Integrated GPU support module.
| System Security Secrets | `modules/system/security/secrets.nix` | Secret management via sops.
| System Security SOPS | `modules/system/security/sops.nix` | SOPS configuration.
| System Services Desktop Input | `modules/system/services/desktop/input.nix` | Desktop input device configuration.
| System Services Desktop Desktop | `modules/system/services/desktop/desktop.nix` | Desktop environment settings.
| System Services Desktop Firefox | `modules/system/services/desktop/firefox.nix` | Firefox browser integration.
| System Core Nixpkgs | `modules/system/core/nixpkgs.nix` | Nixpkgs repository configuration.
| System Core Shell | `modules/system/core/shell.nix` | Shell environment settings.
| System Services Audio Pipewire | `modules/system/services/audio/pipewire.nix` | PipeWire audio streaming setup.
| System Core Input | `modules/system/core/input.nix` | General input configuration.
| System Maintenance Cron | `modules/system/maintenance/cron.nix` | Cron job scheduling.
| System Security SSH | `modules/system/security/ssh.nix` | SSH daemon configuration.
| System Core Locale | `modules/system/core/locale.nix` | Localisation and locale settings.
| System Services Network NFS | `modules/system/services/network/nfs.nix` | NFS server configuration.
| System Core Swap | `modules/system/core/swap.nix` | Swap space configuration.

## Host Configurations
| Host | Path | Purpose |
|---|---|---|
| mac-mini | `hosts/mac-mini/home.nix` | Home‑Manager config for mac‑mini.
| macbook-pro | `hosts/macbook-pro/home.nix` | Home‑Manager config for macbook‑pro.
| ms-02 | `hosts/ms-02/configuration.nix`, `hosts/ms-02/hardware-configuration.nix` | NixOS configuration and hardware settings for ms‑02.
| n10-nixos | `hosts/n10-nixos/configuration.nix`, `hosts/n10-nixos/hardware-configuration.nix` | NixOS configuration and hardware settings for n10‑nixos.

See [Architecture](architecture.md) for detailed layout.