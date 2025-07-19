# # Terminal Setup
# I use zsh as my primary shell, hosted on kitty as it's pretty feature rich
# Starship provides the prompt (which I've probably put significantly too much time into).
{ config, ... }:
{
  imports = [
    ./zsh.nix
    ./nushell.nix
    ./starship.nix
    ./command-not-found.nix
  ];

  home.sessionVariables = {
    NIXOS_CONFIG = "${config.home.homeDirectory}/.config/nixos";
    HOME_CONFIG = "${config.home.homeDirectory}/.config/home-manager";
  };
}
