{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # i got the hash from https://lazamar.co.uk/nix-versions/
    # this has neovim 0.11.2 but its fine
    nixpkgs-old.url = "github:NixOS/nixpkgs/e6f23dc08d3624daab7094b701aa3954923c6bbb";
    codex.url = "github:sadjow/codex-cli-nix";
  };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-old,
      codex,
      ...
    }:

    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          nixpkgsOld = nixpkgs-old;
        };

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
