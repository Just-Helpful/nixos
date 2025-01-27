{ inputs, ... }:
{
  imports = [ inputs.nvf.homeManagerModules.default ];

  # Neovim flake options
  # mostly sourced from the default [config](https://github.com/NotAShelf/nvf/blob/main/configuration.nix)
  programs.nvf.enable = true;
  programs.nvf.settings.vim = {
    # Only allow `nvim` command
    viAlias = false;
    vimAlias = false;

    lsp = {
      # formatOnSave = true;
    };

    autocomplete.nvim-cmp = {
      enable = true;
    };
  };
}
