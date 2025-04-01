{ pkgs, ... }:
{
  imports = [
    ../../desktop/themes/fonts.nix
    ../../utils/nixGL
  ];

  programs.alacritty = {
    enable = true;
    package = pkgs.wrapWithNixGLIntel pkgs.alacritty;

    settings = {
      font.normal.family = "MesloLGL Nerd Font";
      window = {
        decorations = "none";
        opacity = 0.9;
      };

      keyboard.bindings = [
        # Clear terminal via a keybind,
        # works halfway through typing a command
        {
          key = "Delete";
          mods = "Control";
          chars = "\\u000c";
        }
      ];
    };
  };
}
