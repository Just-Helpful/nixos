# Hotkeys
{inputs, ...}: {
  imports = [
    inputs.nvf.homeManagerModules.default
  ];

  programs.nvf.enable = true;
  programs.nvf.settings.vim = {
    binds = {
      whichKey.enable = true;
      cheatsheet.enable = true;
    };
  };
}
