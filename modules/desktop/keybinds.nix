{ ... }:
{
  dconf.enable = true;
  dconf.settings = {
    "org/gnome/desktop/wm/keybindings" = {
      # Close windows easier
      close = [ "<Super>q" ];
      # Disable "move-monitor" keybinds
      move-to-monitor-up = [ ];
      move-to-monitor-down = [ ];
      move-to-monitor-left = [ ];
      move-to-monitor-right = [ ];
    };
  };
}
