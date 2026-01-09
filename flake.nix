{
  description = "Nixos configuration flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixgl = {
      url = "github:nix-community/nixGL";
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
      treefmt-nix,
      ...
    }@inputs:
    let
      eachSystem = nixpkgs.lib.genAttrs [
        "aarch64-darwin"
        "aarch64-linux"
        "x86_64-darwin"
        "x86_64-linux"
      ];

      # define a treefmt package per computer system
      treefmt = eachSystem (
        system: treefmt-nix.lib.evalModule nixpkgs.legacyPackages.${system} ./.github/config/treefmt.nix
      );
    in
    {
      # formatting for this flake, using treefmt and nixfmt-rfc-style
      formatter = eachSystem (system: treefmt.${system}.config.build.wrapper);
      checks = eachSystem (system: {
        formatter = treefmt.${system}.config.build.check self;
      });

      # the actual nixos configuration
      nixosConfigurations.default = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          { nixpkgs.config.allowUnfree = true; }
          { home-manager.users.default = import ./hosts/home/default; }
          ./modules/nixos
          ./hosts/nixos/default
        ];
      };

      # a home manager configuration
      homeConfigurations.default = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = { inherit inputs; };
        modules = [
          { nixpkgs.config.allowUnfree = true; }
          {
            home = {
              username = "default";
              homeDirectory = "/home/default";
            };
          }
          ./hosts/home/default
        ];
      };

      # a home manager configuration
      homeConfigurations.fedora = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = { inherit inputs; };
        modules = [
          { nixpkgs.config.allowUnfree = true; }
          ./hosts/home/fedora
        ];
      };

    };
}
