# Version management
{
  imports = [ ../../terminal/tools/git.nix ];

  programs.nvf.settings.vim = {
    git = {
      enable = true;
      gitsigns.enable = true;
    };

    terminal.toggleterm = {
      enable = true;
      lazygit.enable = true;
    };
  };
}
