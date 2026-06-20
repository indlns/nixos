{
    description = "My system configuration";

    inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
        url = "github:nix-community/home-manager/release-26.05";
        inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix.url = "github:Mic92/sops-nix";
    sops-nix.inputs.nixpkgs.follows = "nixpkgs";
    };

    outputs = inputs@{ nixpkgs, home-manager, sops-nix, ... }:
    let
        system = "x86_64-linux";

        mkHost = name: path:
        nixpkgs.lib.nixosSystem {
            inherit system;

            specialArgs = { inherit inputs; hostName = name; };

            modules = [
            path
            # sops
            sops-nix.nixosModules.sops
            # home-manager IN NIXOS
            home-manager.nixosModules.home-manager
            # глобальная настройка home-manager
            {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.users.indlns = import ./home/indlns.nix;
            }
            ];
        };

    in {
        nixosConfigurations = {
            ms-02 = mkHost "ms-02" ./hosts/ms-02/configuration.nix;
            n10-nixos = mkHost "n10-nixos" ./hosts/n10-nixos/configuration.nix;
        };

        homeConfigurations = {
        macbook-pro = home-manager.lib.homeManagerConfiguration {
            pkgs = nixpkgs.legacyPackages.aarch64-darwin;
            modules = [ ./hosts/macbook-pro/home.nix ];
        };
        mac-mini = home-manager.lib.homeManagerConfiguration {
            pkgs = nixpkgs.legacyPackages.aarch64-darwin;
            modules = [ ./hosts/mac-mini/home.nix ];
        };
        };
    };
}