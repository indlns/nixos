{
    description = "My system configuration";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        sops-nix.url = "github:Mic92/sops-nix";
        sops-nix.inputs.nixpkgs.follows = "nixpkgs";

        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = inputs@{ nixpkgs, home-manager, sops-nix, ... }:
        let 
            system = "x86_64-linux";
        in { 
        nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
            inherit system;
            
            specialArgs = { inherit inputs; };

            modules = [ 
            ./configuration.nix 
            sops-nix.nixosModules.sops 
            ];
        };
        homeConfigurations.indlns = home-manager.lib.homeManagerConfiguration {
            pkgs = nixpkgs.legacyPackages.${system};
            modules = [ 
            ./home-manager/home.nix
            ];
        };
    };
}