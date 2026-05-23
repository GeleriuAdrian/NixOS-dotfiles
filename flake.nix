{
  description = "Ady's NixOS Flake Configuration - Unstable Branch";

  inputs = {
    # Pulling from unstable for bleeding-edge application versions like Zed
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Track master branch of home-manager to cleanly match the unstable packages
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Track musnix for real-time audio optimizations
    musnix = {
      url = "github:musnix/musnix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, musnix, ... }@inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        # Injecting modules natively from our flake inputs
        musnix.nixosModules.musnix
        home-manager.nixosModules.home-manager
        
        ./configuration.nix
      ];
    };
  };
}
