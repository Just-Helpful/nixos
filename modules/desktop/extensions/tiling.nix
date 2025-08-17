# A poor man's Hyprland, for gnome
{ pkgs, ... }:
{
  home.packages = with pkgs.gnomeExtensions; [
    tiling-shell
  ];

  dconf.enable = true;
  dconf.settings = {
    "org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = with pkgs.gnomeExtensions; [
        tiling-shell.extensionUuid
      ];
    };

    "org/gnome/shell/extensions/tilingshell" = {
      # Shortcuts for quick window expansion
      span-window-left = [ "<Shift><Super>Left" ];
      span-window-right = [ "<Shift><Super>Right" ];

      # Window focus border
      enable-window-border = true;
      window-border-width = 2;
      window-border-color = "rgb(53,132,228)";
    };
  };
}
