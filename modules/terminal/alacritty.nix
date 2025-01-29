_: {
  imports = [ ../themes/fonts.nix ];

  programs.alacritty = {
    enable = true;

    settings = {
      font.normal.family = "MesloLGL Nerd Font";
      window = {
        decorations = "none";
        opacity = 0.75;
      };

      keyboard.bindings = [
        # Clear terminal via a keybind,
        # works even halfway through a command
        {
          key = "Delete";
          mods = "Control";
          chars = "\\u000c";
        }
      ];
    };
  };
}
