{
  programs.nvf.settings.vim = {
    lsp = {
      enable = true;
      formatOnSave = true;
      lightbulb.enable = true;
      trouble.enable = true;
      lspSignature.enable = true;
      # maybe enable otter.nvim: lsp for README blocks
    };

    # Languages fully supported by nvf
    languages = {
      enableFormat = true;
      enableTreesitter = true;
      enableExtraDiagnostics = true;

      nix = {
        enable = true;
        format.type = [ "nixfmt" ];
      };
      markdown.enable = true;
      yaml.enable = true;
    };

    autocomplete.nvim-cmp.enable = true;
  };
}
