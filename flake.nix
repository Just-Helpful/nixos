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

    nvim = {
      url = ./flakes/nvf;
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

    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      treefmt-nix,
      flake-utils,
      nvim,
      ...
    }@inputs:

    # flake outputs that rely on a {${output}.${system} = ...} layout
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        # custom packages
        neovim = nvim.packages.${system}.default;
        overlays = [ (_: prev: prev // { inherit neovim; }) ];

        # overlayed `pkgs` instance
        pkgs = import nixpkgs {
          inherit system overlays;
        };
        treefmt = treefmt-nix.lib.evalModule pkgs ./.github/config/treefmt.nix;
      in
      {
        # formatting for this flake, using treefmt and nixfmt-rfc-style
        formatter = treefmt.config.build.wrapper;
        checks.formatter = treefmt.config.build.check self;

        # the actual nixos configuration
        packages.nixosConfigurations.default = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            { nixpkgs.config.allowUnfree = true; }
            { home-manager.users.default = import ./hosts/home; }
            ./modules/nixos
            ./hosts/nixos
          ];
        };
        packages.vm = self.packages.${system}.nixosConfigurations.default.config.system.build.vm;

        # a home manager configuration
        packages.homeConfigurations.default = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = { inherit inputs; };
          modules = [
            { nixpkgs.config.allowUnfree = true; }
            {
              home = {
                username = "default";
                homeDirectory = "/home/default";
              };
            }
            ./hosts/home
          ];
        };

        # a home manager configuration
        packages.homeConfigurations.fedora = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = { inherit inputs; };
          modules = [
            { nixpkgs.config.allowUnfree = true; }
            ./hosts/fedora
          ];
        };
      }
    );
}
