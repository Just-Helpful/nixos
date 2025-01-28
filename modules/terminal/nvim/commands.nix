# Command line config
{inputs, ...}: {
  imports = [
    inputs.nvf.homeManagerModules.default
  ];

  programs.nvf.enable = true;
  programs.nvf.settings.vim = {
    # Only allow `nvim` command
    viAlias = false;
    vimAlias = false;
  };
}
