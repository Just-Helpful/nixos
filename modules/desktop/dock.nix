{ ... }: {
  imports = [
    ../terminal/alacritty.nix
    ../browsers/firefox.nix
  ];

  dconf.settings = {
    "org/gnome/shell".favorite-apps = [
      "firefox-nightly.desktop"
      "Alacritty.desktop"
      "org.gnome.Nautilus.desktop"
    ];
  };
}
