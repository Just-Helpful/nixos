# # Terminal Setup
# I use zsh as my primary shell, hosted on alacritty as I like the config structure.
# Starship provides the prompt (which I've probably put significantly too much time into).
{
  imports = [
    ./zsh.nix
    ./nushell.nix
    ./alacritty.nix
    ./starship.nix
  ];
}
