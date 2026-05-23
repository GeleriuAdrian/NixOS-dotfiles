{
  description = "Ady's NixOS Flake Configuration - Unstable Branch";

  inputs = {
    # Main system packages (unstable)
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    
    # Fallback channel to pull stable versions of broken packages
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.11";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    musnix = {
      url = "github:musnix/musnix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-stable, home-manager, musnix, ... }@inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      # This argument makes all flake inputs accessible directly inside configuration.nix
      specialArgs = { inherit inputs; }; 
      modules = [
        musnix.nixosModules.musnix
        home-manager.nixosModules.home-manager
        
        ./configuration.nix
      ];
    };
  };
}
