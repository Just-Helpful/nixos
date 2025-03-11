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
      treefmt
      gnome-tweaks
    ];

    file = { };

    stateVersion = "24.11";
  };
}
