{ pkgs, ... }:
{
  home.packages = with pkgs.gnomeExtensions; [
    caffeine
  ];

  dconf.enable = true;
  dconf.settings = {
    "org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = with pkgs.gnomeExtensions; [
        caffeine.extensionUuid
      ];
    };

    "org/gnome/shell/extensions/caffeine" = {
      show-indicator = "never";
      show-notifications = false;
      screen-blank = "always";
      trigger-apps-mode = "on-focus";
    };
  };
}
