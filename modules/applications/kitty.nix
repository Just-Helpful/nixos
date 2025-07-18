{
  programs.kitty = {
    enable = true;

    font = {
      name = "MesloLGL Nerd Font";
    };

    settings = {
      placement_strategy = "top-left";
      hide_window_decorations = true;

      # colour scheme (matches alacritty default)
      background_opacity = 0.7;
      foreground = "#d8d8d8";
      background = "#181818";
      selection_foreground = "#181818";
      selection_background = "#d8d8d8";

      color0 = "#181818"; # .black     normal
      color1 = "#ac4242"; # .red       normal
      color2 = "#90a959"; # .green     normal
      color3 = "#f4bf75"; # .yellow    normal
      color4 = "#6a9fb5"; # .blue      normal
      color5 = "#aa759f"; # .magenta   normal
      color6 = "#75b5aa"; # .cyan      normal
      color7 = "#d8d8d8"; # .white     normal
      color8 = "#6b6b6b"; # .black     bright
      color9 = "#c55555"; # .red       bright
      color10 = "#aac474"; # green     bright
      color11 = "#feca88"; # yellow    bright
      color12 = "#82b8c8"; # blue      bright
      color13 = "#c28cb8"; # magenta   bright
      color14 = "#93d3c3"; # cyan      bright
      color15 = "#f8f8f8"; # white     bright
    };

    keybindings = {
      "ctrl+delete" = "clear_terminal to_cursor active";
    };
  };
}
