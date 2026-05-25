{ pkgs, ... }:
{
  home.packages = with pkgs.gnomeExtensions; [ blur-my-shell ];

  dconf.enable = true;
  dconf.settings = {
    "org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = with pkgs.gnomeExtensions; [
        blur-my-shell.extensionUuid
      ];
    };

    "org/gnome/shell/extensions/blur-my-shell" = {
      "applications/dynamic-opacity" = false;
      "applications/enable-all" = true;
      "applications/blacklist" = [
        "Plank"
        "com.desktop.ding"
        "Conky"
        "org.mozilla.firefox"
      ];
    };
  };
}
