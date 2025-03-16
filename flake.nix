{
  description = "Nixos configuration flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    flake-utils.url = "github:numtide/flake-utils";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur = {
      url = "github:nix-community/nur";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox = {
      url = "github:nix-community/flake-firefox-nightly";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Nix's `command-not-found` doesn't play well with flakes
    # So we need to use a flake specific patch by wamserma
    programs-sqlite = {
      url = "github:wamserma/flake-programs-sqlite";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      flake-utils,
      treefmt-nix,
      ...
    }@inputs:
    let
      inherit (flake-utils.lib) eachDefaultSystem;

      # define a treefmt package per computer system
      treefmt = eachDefaultSystem (
        system: treefmt-nix.lib.evalModule nixpkgs.legacyPackages.${system} ./.github/config/treefmt.nix
      );
    in
    {
      # formatting for this flake, using treefmt and nixfmt-rfc-style
      formatter = eachDefaultSystem (system: treefmt.${system}.config.build.wrapper);
      checks = eachDefaultSystem (system: {
        formatter = treefmt.${system}.config.build.check self;
      });

      # the actual nixos configuration
      nixosConfigurations.default = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          { nixpkgs.overlays = with inputs; [ nur.overlays.default ]; }
          inputs.programs-sqlite.nixosModules.programs-sqlite
          ./hosts/nixos/default
        ];
      };

      # a home manager configuration
      homeConfigurations.default = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = { inherit inputs; };
        modules = [
          { nixpkgs.overlays = with inputs; [ nur.overlays.default ]; }
          ./hosts/home/default
        ];
      };
    };
}
