{
  imports = [
    ../applications/kitty.nix
    ../applications/firefox
  ];

  dconf.enable = true;
  dconf.settings = {
    "org/gnome/shell".favorite-apps = [
      "firefox.desktop"
      "kitty.desktop"
      "org.gnome.Nautilus.desktop"
    ];
  };
}
