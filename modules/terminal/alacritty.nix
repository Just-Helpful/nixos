{ ... }: {
  imports = [
    ./fonts.nix
  ];

  programs.alacritty = { 
    enable = true;

    settings = {
      font.normal.family = "MesloLGL Nerd Font";
      keyboard.bindings = [
        { key = "Delete"; mods = "Control"; chars = "\u000c"; }
      ];
    };
  };
}
