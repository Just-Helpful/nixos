{ config, pkgs, ... }:

{
  imports = [
    ../../modules/base
    ../../modules/themes
    ../../modules/browsers
    ../../modules/terminal
  ];

  home.username = "alexc";
  home.homeDirectory = "/home/alexc";

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    alacritty
  ];

  home.file = {
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };
  
  home.stateVersion = "24.11";
  programs.home-manager.enable = true;
}
