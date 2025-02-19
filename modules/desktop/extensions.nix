{ pkgs, ... }:
{
  dconf.enable = true;
  dconf.settings."org/gnome/shell" = {
    disable-user-extensions = false;
    enabled-extensions = with pkgs.gnomeExtensions; [
      todotxt.extensionUuid
      lilypad.extensionUuid
    ];
  };

  home.packages = with pkgs.gnomeExtensions; [
    todotxt
    lilypad
  ];
}
