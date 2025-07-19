{ pkgs, ... }:
{
  home.packages = with pkgs.gnomeExtensions; [
    hide-top-bar
  ];

  dconf.enable = true;
  dconf.settings."org/gnome/shell" = {
    disable-user-extensions = false;
    enabled-extensions = with pkgs.gnomeExtensions; [
      hide-top-bar.extensionUuid
    ];
  };
}
