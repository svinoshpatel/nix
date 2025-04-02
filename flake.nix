{
  description = "My system configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvchad4nix = {
      url = "github:nix-community/nix4nvchad";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
    
  outputs = { nixpkgs, home-manager, nvchad4nix, ... }: {
    nixosConfigurations.hruk = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux"; 
      modules = [ ./configuration.nix ];
    };

    homeConfigurations.svinoshpatel = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages."x86_64-linux";
      extraSpecialArgs = { inherit nvchad4nix; };
      modules = [ ./home.nix ];
    };
  };
}
