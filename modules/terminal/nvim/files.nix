# File navigation
{inputs, ...}: {
  imports = [
    inputs.nvf.homeManagerModules.default
  ];

  programs.nvf.enable = true;
  programs.nvf.settings.vim = {
    filetree.neo-tree.enable = true;
    tabline.nvimBufferline.enable = true;
    visuals.nvim-web-devicons.enable = true;
  };
}
