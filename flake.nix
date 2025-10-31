{
  description = "A simple NixOS flake";

  inputs = {

    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    nixos-hardware = {
      url = "github:NixOS/nixos-hardware/master";
    };

    home-manager = { 
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    disko = {
      url = "github:nix-community/disko/latest";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.4.2";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    mango = {
      url = "github:DreamMaoMao/mango";
    };
  };

  outputs = { self, nixpkgs, nixos-hardware, home-manager, disko, lanzaboote, mango, ... } @ inputs:
  let
  in
  {
    nixosConfigurations = {
    # Main Desktop
      aconite = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/aconite
          disko.nixosModules.disko
          lanzaboote.nixosModules.lanzaboote
          mango.nixosModules.mango
          home-manager.nixosModules.home-manager 
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.db = import ./home-manager/aconite.nix;
            home-manager.sharedModules = [ mango.hmModules.mango ];
            home-manager.extraSpecialArgs = { inherit inputs; };
          }
        ];
      };
      maconite = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/maconite
          disko.nixosModules.disko
          mango.nixosModules.mango
          nixos-hardware.nixosModules.apple-macbook-air-7
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.db = import ./home-manager/maconite.nix;
            home-manager.sharedModules = [ mango.hmModules.mango ];
            home-manager.extraSpecialArgs = { inherit inputs; };
          }
        ];
      };
    };
  };
}
