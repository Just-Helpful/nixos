# Version management
_: {
  programs.nvf.enable = true;
  programs.nvf.settings.vim = {
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
