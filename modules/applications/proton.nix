{ pkgs, ... }:
{
  home.packages = with pkgs; [
    proton-vpn
    proton-pass
    protonmail-desktop
  ];
}
