{
  description = "My system configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-old.url = "github:NixOS/nixpkgs/c5dd43934613ae0f8ff37c59f61c507c2e8f980d";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
    
  outputs = { nixpkgs, home-manager, nixpkgs-old, ... }: {
    nixosConfigurations.hruk = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux"; 
      modules = [
        ./configuration.nix
        { boot.kernelPackages = nixpkgs-old.legacyPackages.x86-64-linux.linuxPackages_6_6; }
      ];
    };

    homeConfigurations.svinoshpatel = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages."x86_64-linux";
      modules = [ ./home.nix ];
    };
  };
}
