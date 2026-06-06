{
    description = "My system configuration";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        sops-nix.url = "github:Mic92/sops-nix";
        sops-nix.inputs.nixpkgs.follows = "nixpkgs";

        home-manager = {
            url = "github:nix-community/home-manager/release-26.05";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = inputs@{ nixpkgs, home-manager, sops-nix, ... }:
        let 
            system = "x86_64-linux";
        in { 
        nixosConfigurations.server = nixpkgs.lib.nixosSystem {
            inherit system;
            
            specialArgs = { inherit inputs; };

            modules = [ 
            ./hosts/server/configuration.nix 
            sops-nix.nixosModules.sops 
            ];
        };
        homeConfigurations.indlns = home-manager.lib.homeManagerConfiguration {
            pkgs = nixpkgs.legacyPackages.${system};
            modules = [ 
            ./home/indlns.nix
            ];
        };
    };
}