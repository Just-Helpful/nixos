{
  dconf.enable = true;
  dconf.settings = {
    "org/gnome/desktop/wm/keybindings" = {
      # Close windows easier
      close = [ "<Super>q" ];
      # Use "<Super>" for window actions, by default
      activate-window-menu = "<Super>space";
      switch-input-source = "";
      switch-input-source-backward = "";
      # Disable "move-monitor" keybinds
      move-to-monitor-up = [ ];
      move-to-monitor-down = [ ];
      move-to-monitor-left = [ ];
      move-to-monitor-right = [ ];
    };
  };
}
