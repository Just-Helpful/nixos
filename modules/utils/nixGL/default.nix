{ inputs, ... }:
{
  imports = [ ./alacritty.nix ];

  config.nixpkgs.overlays = [
    (import ./wrapper.nix inputs)
  ];
}
