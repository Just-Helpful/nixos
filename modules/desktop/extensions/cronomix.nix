{ pkgs, ... }:
{
  home.packages = with pkgs.gnomeExtensions; [ cronomix ];

  dconf.enable = true;
  dconf.settings."org/gnome/shell" = {
    disable-user-extensions = false;
    enabled-extensions = with pkgs.gnomeExtensions; [
      cronomix.extensionUuid
    ];
  };
}
