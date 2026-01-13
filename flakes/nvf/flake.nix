{
  description = "Nvim custom package";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

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
    {
      self,
      nvf,
      nixpkgs,
      treefmt-nix,
      ...
    }:
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

      # define the default package that provides neovim
      packages = eachSystem (system: {
        default =
          (nvf.lib.neovimConfiguration {
            pkgs = nixpkgs.legacyPackages.${system};
            modules = [ ./modules ];
          }).neovim;
      });
    };
}
