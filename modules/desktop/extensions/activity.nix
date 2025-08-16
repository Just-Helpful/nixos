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
      screen-blank = "always";
      trigger-apps-mode = "on-focus";
    };
  };
}
