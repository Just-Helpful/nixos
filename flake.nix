{
  description = "Nixos configuration flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

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
  };

  outputs =
    { self, nixpkgs, ... }@inputs:
    let
      system = "x86_64-linux";
      treefmtBuilder = inputs.treefmt-nix.lib.evalModule nixpkgs.legacyPackages.${system};
      treefmt = treefmtBuilder ./.github/config/treefmt.nix;
    in
    {
      # formatting for this flake, using treefmt and nixfmt-rfc-style
      formatter.${system} = treefmt.config.build.wrapper;
      checks.${system}.formatting = treefmt.config.build.check self;

      # the actual nixos configuration
      nixosConfigurations.default = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs system; };
        modules = [
          { nixpkgs.overlays = with inputs; [ nur.overlays.default ]; }
          ./hosts/default
        ];
      };
    };
}
