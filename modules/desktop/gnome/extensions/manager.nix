{ pkgs, ... }:
{
  home.packages = with pkgs; [ gnome-extension-manager ];
}
