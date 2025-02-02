# Command line config
_: {
  programs.nvf.enable = true;
  programs.nvf.settings.vim = {
    # Only allow `nvim` command
    viAlias = false;
    vimAlias = false;
  };
}
