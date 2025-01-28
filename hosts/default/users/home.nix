{ pkgs, ... }:
{
  imports = [ ../../../modules ];

  programs.home-manager.enable = true;

  home = {
    username = "alexc";
    homeDirectory = "/home/alexc";

    # The home.packages option allows you to install Nix packages into your
    # environment.
    packages = with pkgs; [
      alacritty
      treefmt2
    ];

    file = { };

    sessionVariables = {
      EDITOR = "nvim";
    };

    stateVersion = "24.11";
  };
}
