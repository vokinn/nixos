{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    codex.url = "github:sadjow/codex-cli-nix";
    sops-nix.url = "github:Mic92/sops-nix";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      codex,
      sops-nix,
      home-manager,
      ...
    }:

    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit codex; };

        modules = [
          sops-nix.nixosModules.sops
          ./hosts/nixos
          ./modules/audio.nix
          ./modules/graphics.nix
          ./modules/networking.nix
          ./modules/niri.nix
          ./modules/security.nix
          ./modules/system.nix

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit codex; };
            home-manager.users.vokin = import ./home;
          }
        ];
      };
    };
}
