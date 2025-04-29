# Neovim flake options
# mostly sourced from the default [config](https://github.com/NotAShelf/nvf/blob/main/configuration.nix)
{ inputs, ... }:
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
    inputs.nvf.homeManagerModules.default
  ];

  programs.nvf.enable = true;
  home.sessionVariables = {
    EDITOR = "nvim";
  };
}
