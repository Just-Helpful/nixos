# Buffer editing
_: {
  programs.nvf.enable = true;
  programs.nvf.settings.vim = {
    ui = {
      illuminate.enable = true;
      fastaction.enable = true;
    };
    visuals = {
      nvim-scrollbar.enable = true;
      indent-blankline.enable = true;
    };
    autopairs.nvim-autopairs.enable = true;

    options = {
      tabstop = 2;
      shiftwidth = 0;
    };
  };
}
