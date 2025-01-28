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

      nix = {
        enable = true;
        format.type = "nixfmt";
      };
      markdown.enable = true;
    };

    autocomplete.nvim-cmp.enable = true;
  };
}
