{ config, pkgs, ... }:
{
  imports = [ ../../../modules ];

  home.username = "alexc";
  home.homeDirectory = "/home/alexc";

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    alacritty
    treefmt2
  ];

  home.file = { };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  home.stateVersion = "24.11";
  programs.home-manager.enable = true;
}
