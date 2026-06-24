{ hostName, lib, ... }:

{
    imports =
    [ # always included
        ./core/input.nix
        ./core/locale.nix
        ./core/nix.nix
        ./core/nixpkgs.nix
        ./core/packages.nix
        ./core/shell.nix
        ./core/swap.nix
        ./core/users.nix

        ./maintenance/cleanup.nix
        ./maintenance/cron.nix

        ./networking/network.nix

        ./security/secrets.nix
        ./security/sops.nix
        ./security/ssh.nix

        ./services/audio/pipewire.nix
        ./services/desktop/desktop.nix
        ./services/desktop/firefox.nix
        ./services/desktop/input.nix
    ]

    # host-specific modules
    ++ lib.optional (hostName == "ms-02") ./hardware/graphics.nix
    ++ lib.optional (hostName == "ms-02") ./hardware/igpu.nix
    ++ lib.optional (hostName == "ms-02") ./hardware/dgpu.nix
    ++ lib.optional (hostName == "ms-02") ./services/ai/llama.nix
    ++ lib.optional (hostName == "ms-02") ./services/network/nfs.nix
    ++ lib.optional (hostName == "n10-nixos" || hostName == "ms-02") ./virtualization/docker.nix;
}
