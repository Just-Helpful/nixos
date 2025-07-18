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

      color0 = "#0f0f0f"; # black     dull
      color1 = "#712b2b"; # red       dull
      color2 = "#5f6f3a"; # green     dull
      color3 = "#a17e4d"; # yellow    dull
      color4 = "#456877"; # blue      dull
      color5 = "#704d68"; # magenta   dull
      color6 = "#4d7770"; # cyan      dull
      color7 = "#8e8e8e"; # white     dull
      color8 = "#6b6b6b"; # black     bright
      color9 = "#c55555"; # red       bright
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
