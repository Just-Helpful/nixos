{ pkgs, ... }:
{
  imports = [ ../../../modules ];

  programs.home-manager.enable = true;

  home = {
    username = "alex-colby";
    homeDirectory = "/home/alex-colby";

    file = { };
  };

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    treefmt
    gnome-tweaks
  ];

  home.stateVersion = "24.11";
}
