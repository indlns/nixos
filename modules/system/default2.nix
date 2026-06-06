{
    imports = [
    ./core/input.nix
    ./core/locale.nix
    ./core/nix.nix
    ./core/nixpkgs.nix
    ./core/shell.nix
    ./core/swap.nix 
    ./core/users.nix

    ./maintenance/cleanup.nix
    ./maintenance/cron.nix

    ./networking/network.nix

    ./security/secrets.nix
    ./security/sops.nix
    ./security/ssh.nix

    ./virtualization/docker2.nix

    ./services/audio/pipewire.nix
    ./services/desktop/desktop.nix
    ./services/desktop/firefox.nix
    ./services/desktop/input.nix
    ];
}