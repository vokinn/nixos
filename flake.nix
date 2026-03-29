{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    codex.url = "github:sadjow/codex-cli-nix";
  };

  outputs =
    {
      self,
      nixpkgs,
      codex,
      ...
    }:

    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          (
            { pkgs, ... }:
            {
              environment.systemPackages = [
                codex.packages.x86_64-linux.default
              ];
            }
          )

          ./configuration.nix
        ];
      };
    };
}
