{ inputs, ... }:
{
  nixpkgs.overlays = [
    (import ./wrapper.nix inputs)
    (final: prev: { alacritty = final.wrapWithNixGLIntel prev.alacritty; })
  ];
}
