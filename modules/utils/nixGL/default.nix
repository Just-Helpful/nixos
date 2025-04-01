{ inputs, ... }:
{
  nixpkgs.overlays = [
    inputs.nixgl.overlay
    (import ./wrapper.nix)
  ];
}
