# Neovim flake options
# mostly sourced from the default [config](https://github.com/NotAShelf/nvf/blob/main/configuration.nix)
{inputs, ...}: {
  imports = [inputs.nvf.homeManagerModules.default];

  programs.nvf.enable = true;
  programs.nvf.settings.vim = {
    # Command line config
    # Only allow `nvim` command
    viAlias = false;
    vimAlias = false;

    # Visuals
    theme = {
      enable = true;
      name = "tokyonight";
      style = "night";
      transparent = true;
    };

    ui.noice.enable = true;
    notify.nvim-notify.enable = true;

    statusline.lualine = {
      enable = true;
      theme = "tokyonight";
    };

    # Hotkeys
    binds = {
      whichKey.enable = true;
      cheatsheet.enable = true;
    };

    # File navigation
    filetree.neo-tree.enable = true;
    tabline.nvimBufferline.enable = true;
    visuals.nvim-web-devicons.enable = true;

    # Buffer editing
    options = {
      tabstop = 2;
      shiftwidth = 0;
    };

    ui.illuminate.enable = true;
    visuals = {
      nvim-scrollbar.enable = true;
      indent-blankline.enable = true;
    };

    lsp = {
      formatOnSave = true;
      lightbulb.enable = true;
      trouble.enable = true;
      lspSignature.enable = true;
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

    autocomplete.nvim-cmp.enable = true;

    # Version management
    git = {
      enable = true;
      gitsigns.enable = true;
      gitsigns.codeActions.enable = true;
    };

    terminal.toggleterm = {
      enable = true;
      lazygit.enable = true;
    };
  };
}
