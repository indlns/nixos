{
imports =
    [ # Include the results of the hardware scan.
    ./users.nix
    ./docker.nix
    ./nfs.nix
    ./cleanup.nix
    ./swap.nix
    ./sops.nix
    ./secrets.nix
    ./llama.nix
    ];
}