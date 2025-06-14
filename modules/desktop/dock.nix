{
  imports = [
    ../applications/alacritty.nix
    ../applications/firefox.nix
  ];

  dconf.enable = true;
  dconf.settings = {
    "org/gnome/shell".favorite-apps = [
      "firefox-nightly.desktop"
      "Alacritty.desktop"
      "org.gnome.Nautilus.desktop"
    ];
  };
}
