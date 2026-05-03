{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    codex.url = "github:sadjow/codex-cli-nix";
    sops-nix.url = "github:Mic92/sops-nix";
    gemini-cli-nix = {
      url = "github:Daaboulex/gemini-cli-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      codex,
      sops-nix,
      gemini-cli-nix,
      home-manager,
      noctalia,
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
            home-manager.extraSpecialArgs = { inherit codex gemini-cli-nix noctalia; };
            home-manager.users.vokin = import ./home;
          }
        ];
      };
    };
}
