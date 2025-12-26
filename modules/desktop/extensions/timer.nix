{ pkgs, ... }:
{
  home.packages = with pkgs.gnomeExtensions; [
    timer
  ];

  dconf.enable = true;
  dconf.settings."org/gnome/shell" = {
    disable-user-extensions = false;
    enabled-extensions = with pkgs.gnomeExtensions; [
      timer.extensionUuid
    ];
  };
}
