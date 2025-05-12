{ config, ... }:
{
  imports = [
    ../../desktop/themes/fonts.nix
    ./nushell.nix
  ];

  programs.alacritty = {
    enable = true;

    settings = {
      font.normal.family = "MesloLGL Nerd Font";
      window = {
        decorations = "none";
        opacity = 0.7;
      };

      terminal.shell = "${config.programs.nushell.package}/bin/nu";

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
