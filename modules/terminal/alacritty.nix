{ ... }: {
  programs.alacritty = { 
    enable = true;

    settings = {
      # font.normal.family = "";
      keyboard.bindings = [
        { key = "Delete"; mods = "Control"; chars = "\u000c"; }
      ];
    };
  };
}
