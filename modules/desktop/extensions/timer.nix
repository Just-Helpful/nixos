{ pkgs, ... }:
{
  home.packages = with pkgs.gnomeExtensions; [
    timer
  ];
}
