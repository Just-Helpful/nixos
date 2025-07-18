{ pkgs, ... }:
{
  home.packages = with pkgs.gnomeExtensions; [
    clipboard-indicator
  ];

  dconf.enable = true;
  dconf.settings."org/gnome/shell" = {
    disable-user-extensions = false;
    enabled-extensions = with pkgs.gnomeExtensions; [
      clipboard-indicator.extensionUuid
    ];
  };
}
