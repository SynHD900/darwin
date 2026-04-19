{
  description = "My Darwin / macOS Configurations";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    my-modules = {
      url = "git+ssh://git@github.com/SynHD900/modules.git?ref=main";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      my-modules,
      ...
    }@inputs:
    let
      mainUser = "synhd";
      darwinSystem = "aarch64-darwin";

      pkgs = import nixpkgs {
        system = darwinSystem;
        config.allowUnfree = true;
      };

      allInputs = inputs // my-modules // my-modules.inputs;

      darwinSpecialArgs = {
        inputs = allInputs;
        inherit mainUser;
        system = darwinSystem;
      };
    in
    {
      darwinConfigurations = {
        macos = allInputs.nix-darwin.lib.darwinSystem {
          inherit pkgs;
          specialArgs = darwinSpecialArgs;
          modules = [
            ./hosts/macos
            my-modules.darwinModules.default
            my-modules.nixosModules.shared
          ];
        };
      };
    };
}
