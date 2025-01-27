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
      formatOnSave = true;
      lightbulb.enable = true;
      trouble.enable = true;
      # maybe enable otter.nvim: lsp for README blocks
    };

    languages = {
      enableLSP = true;
      enableFormat = true;
      enableTreesitter = true;
      enableExtraDiagnostics = true;

      nix.enable = true;
      markdown.enable = true;
    };

    autocomplete.nvim-cmp = {
      enable = true;
    };

    theme = {
      enable = true;
      name = "tokyonight";
      style = "night";
      transparent = true;
    };
  };
}
