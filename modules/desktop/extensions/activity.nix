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

      "extensions/caffeine" = {
        show-indicator = "never";
      };
    };
  };
}
