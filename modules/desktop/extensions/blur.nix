{ pkgs, ... }:
{
  home.packages = with pkgs.gnomeExtensions; [ blur-my-shell ];

  # dconf.enable = true;
  # dconf.settings = {
  #   "org/gnome/shell" = {
  #     disable-user-extensions = false;
  #     enabled-extensions = with pkgs.gnomeExtensions; [
  #       tiling-shell.extensionUuid
  #     ];
  #   };

  #   "org/gnome/shell/extensions/tilingshell" = {
  #     # Shortcuts for quick window expansion
  #     span-window-up = [ "<Shift><Super>Up" ];
  #     span-window-down = [ "<Shift><Super>Down" ];
  #     span-window-left = [ "<Shift><Super>Left" ];
  #     span-window-right = [ "<Shift><Super>Right" ];
  #   };
  # };
}
