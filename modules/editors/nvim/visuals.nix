# Visuals
_: {
  programs.nvf.enable = true;
  programs.nvf.settings.vim = {
    theme = {
      enable = true;
      name = "tokyonight";
      style = "night";
      transparent = true;
    };

    ui = {
      borders.enable = true;
      noice.enable = true;
    };
    notify.nvim-notify.enable = true;

    statusline.lualine = {
      enable = true;
      theme = "tokyonight";
    };
  };
}
