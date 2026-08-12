{ pkgs, ... }:
{
  home.packages = with pkgs.gnomeExtensions; [
    pip-on-top
  ];

  dconf.enable = true;
  dconf.settings = {
    "org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = with pkgs.gnomeExtensions; [
        pip-on-top.extensionUuid
      ];
    };

    "org/gnome/shell/extensions/pip-on-top" = {
      stick = true;
    };
  };
}
