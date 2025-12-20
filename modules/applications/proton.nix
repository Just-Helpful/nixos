{ pkgs, ... }:
{
  home.packages = with pkgs; [
    protonvpn-gui
    proton-pass
    protonmail-desktop
  ];
}
