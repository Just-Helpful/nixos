# Tweaks to fix bevy apps running on fedora
{ pkgs, ... }: {
  home.packages = with pkgs; [ wayland ];
}
