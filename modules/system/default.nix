{
imports =
    [
    ./core/boot.nix
    ./core/input.nix
    ./core/locale.nix
    ./core/nix.nix
    ./core/nixpkgs.nix
    ./core/shell.nix
    ./core/swap.nix 
    ./core/users.nix

    ./hardware/igpu.nix

    ./maintenance/cleanup.nix
    ./maintenance/cron.nix

    ./networking/network.nix

    ./security/secrets.nix
    ./security/sops.nix
    ./security/ssh.nix

    ./virtualization/docker.nix
    
    ./services/ai/llama.nix
    # ./services/ai/ollama.nix
    ./services/audio/pipewire.nix
    ./services/desktop/desktop.nix
    ./services/desktop/firefox.nix
    ./services/desktop/input.nix
    ./services/network/nfs.nix
    ];
}