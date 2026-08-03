# Neovim flake options
# mostly sourced from the default [config](https://github.com/NotAShelf/nvf/blob/main/configuration.nix)
{ pkgs, ... }:
{
  home.sessionVariables = {
    EDITOR = "nvim";
  };
  home.packages = [ pkgs.neovim ];
}
