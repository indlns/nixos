{
imports =
    [ 
    ./core/users.nix
    ./core/swap.nix
    ./core/cleanup.nix

    ./security/sops.nix
    ./security/secrets.nix

    ./virtualization/docker/docker.nix
    
    ./services/llama.nix
    ./services/nfs.nix
    ];
}