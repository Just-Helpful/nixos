{
  nixpkgs.overlays = [
    (_: prev: { alacritty = prev.wrapWithNixGLIntel prev.alacritty; })
  ];
}
