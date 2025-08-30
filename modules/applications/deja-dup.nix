{
  dconf.enable = true;
  dconf.settings = {
    "org/gnome/deja-dup" = {
      periodic = true;
      periodic-period = 1;
      delete-after = 182;
      tool-when-new = "restic";

      include-list = [
        "/home/default/.local/share/keyrings"
        "/home/default/.local/share/PrismLauncher"
        "/home/default/.local/share/todo.txt"
        "/home/default/.mozilla/firefox/alexc/bookmarkbackups"
        "/home/default/Documents"
        "/home/default/Music"
        "/home/default/Pictures"
      ];

      exclude-list = [ ];
    };
  };
}
