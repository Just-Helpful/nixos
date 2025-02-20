{ pkgs, ... }:
{
  home.packages = with pkgs.gnomeExtensions; [
    todotxt
    clipboard-indicator
    hide-top-bar
  ];

  dconf.enable = true;
  dconf.settings."org/gnome/shell" = {
    disable-user-extensions = false;
    enabled-extensions = with pkgs.gnomeExtensions; [
      todotxt.extensionUuid
      clipboard-indicator.extensionUuid
      hide-top-bar.extensionUuid
    ];
  };

  dconf.settings = {
    "org/gnome/shell/extensions/hidetopbar" = {
      mouse-sensitive = true;
    };
  };
}
