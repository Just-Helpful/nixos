{ pkgs, ... }:
{
  imports = [
    ./caffeine.nix
    ./clipboard.nix
    ./pip-on-top.nix
    ./tiling.nix
    ./todotxt.nix
    ./top-bar.nix
    ./windows.nix
  ];

  home.packages = with pkgs; [ gnome-extension-manager ];
}
