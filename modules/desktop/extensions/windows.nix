# A poor man's Hyprland, for gnome
{ pkgs, ... }:
{
  home.packages = with pkgs.gnomeExtensions; [
    rounded-window-corners-reborn
  ];

  dconf.enable = true;
  dconf.settings = {
    "org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = with pkgs.gnomeExtensions; [
        rounded-window-corners-reborn.extensionUuid
      ];
    };

    "org/gnome/shell/extensions/rounded-window-corners-reborn" = {
      border-width = 1;
    };
  };
}
