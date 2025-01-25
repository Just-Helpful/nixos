{ ... }: {
  dconf.enable = true;
  dconf.settings = {
    "org/gnome/mutter" = {
      dynamic-workspaces = true;
      workspaces-only-on-primary = true;
    };
  };
}
