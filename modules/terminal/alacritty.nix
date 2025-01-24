{ ... }: {
  imports = [
    ./fonts.nix
  ];

  programs.alacritty = { 
    enable = true;

    settings = {
      font.normal.family = "MesloLGL Nerd Font";
      keyboard.bindings = [
        # Clear terminal via a keybind,
	# works even halfway through a command
        { key = "Delete"; mods = "Control"; chars = "\\u000c"; }
      ];
    };
  };
}
