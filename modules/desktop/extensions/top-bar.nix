{ pkgs, ... }:
{
  home.packages = with pkgs.gnomeExtensions; [
    hide-top-bar
    disable-unredirect-fullscreen-windows
  ];

  dconf.enable = true;
  dconf.settings."org/gnome/shell" = {
    disable-user-extensions = false;
    enabled-extensions = with pkgs.gnomeExtensions; [
      hide-top-bar.extensionUuid
      disable-unredirect-fullscreen-windows.extensionUuid
    ];
  };
}
