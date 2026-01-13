# Neovim flake options
# mostly sourced from the default [config](https://github.com/NotAShelf/nvf/blob/main/configuration.nix)
{ ... }:
{
  imports = [
    ./files.nix
    ./buffers.nix
    ./visuals.nix
    ./commands.nix
    ./keybinds.nix
    ./versioning.nix
    ./modules
    ./languages
  ];

  programs.nvf.enable = true;
}
