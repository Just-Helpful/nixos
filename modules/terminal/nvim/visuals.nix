# Visuals
{inputs, ...}: {
  imports = [
    inputs.nvf.homeManagerModules.default
  ];

  programs.nvf.enable = true;
  programs.nvf.settings.vim = {
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
  };
}
