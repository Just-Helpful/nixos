# # Terminal Setup
# I use zsh as my primary shell, hosted on kitty as it's pretty feature rich
# Starship provides the prompt (which I've probably put significantly too much time into).
{ config, ... }:
{
  imports = [
    ./nushell.nix
    ./starship.nix
    ./command-not-found.nix
  ];

  home.sessionVariables = {
    NIX_CONFIG_PATH = "${config.home.homeDirectory}/.config/nixos";
    NIX_CONFIG_NAME = "default"; # the attribute name used for config outputs, i.e. ".#<NIX_CONFIG_NAME>"
  };
}
