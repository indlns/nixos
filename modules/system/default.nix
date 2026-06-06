{
imports =
    [
    ./core/locale.nix
    ./core/swap.nix 
    ./core/users.nix
    
    ./maintenance/cleanup.nix

    ./networking/network.nix

    ./security/sops.nix
    ./security/secrets.nix

    ./virtualization/docker.nix
    
    ./services/ai/llama.nix
    # ./services/ai/ollama.nix
    
    ./services/network/nfs.nix
    ];
}