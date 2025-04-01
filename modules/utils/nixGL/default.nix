{ inputs, ... }:
{
  nixpkgs.overlays = [
    (import ./wrapper.nix inputs)
  ];
}
