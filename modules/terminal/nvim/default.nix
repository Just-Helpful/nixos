{inputs, ...}: {
  imports = [inputs.nvf.homeManagerModules.default];

  # Neovim flake options
  # mostly sourced from the default [config](https://github.com/NotAShelf/nvf/blob/main/configuration.nix)
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
      fidget-nvim.enable = true;
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

    # Committing changes
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
