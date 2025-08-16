{ pkgs, ... }:
{
  home.packages = with pkgs; [ gnomeExtensions.espresso ];
}
