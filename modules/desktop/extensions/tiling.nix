# A poor man's Hyprland, for gnome
{ pkgs, ... }:
{
  home.packages = with pkgs.gnomeExtensions; [
    tiling-shell
  ];

  dconf.enable = true;
  dconf.settings."org/gnome/shell" = {
    disable-user-extensions = false;
    enabled-extensions = with pkgs.gnomeExtensions; [
      tiling-shell.extensionUuid
    ];
  };
}
