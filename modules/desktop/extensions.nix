{ pkgs, ... }:
{
  home.packages = with pkgs.gnomeExtensions; [
    todotxt
    lilypad
    clipboard-indicator
    hide-top-bar
  ];

  dconf.enable = true;
  dconf.settings."org/gnome/shell" = {
    disable-user-extensions = false;
    enabled-extensions = with pkgs.gnomeExtensions; [
      todotxt.extensionUuid
      lilypad.extensionUuid
      clipboard-indicator.extensionUuid
      hide-top-bar.extensionUuid
    ];
  };

  dconf.settings = {
    "org/gnome/shell/extensions/lilypad" = {
      show-icons = true;
      reorder = true;
      ignored-order = "@as []";
      lilypad-order = [
        "todoTxt"
        "clipboardIndicator"
      ];
      rightbox-order = [ "lilypad" ];
    };
    "org/gnome/shell/extensions/hidetopbar" = {
      mouse-sensitive = true;
    };
  };
}
