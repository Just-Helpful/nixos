{ pkgs, ... }:
{
  dconf.enable = true;
  dconf.settings."org/gnome/shell" = {
    disable-user-extensions = false;
    enabled-extensions = with pkgs.gnomeExtensions; [
      todotxt.extensionUuid
    ];
  };

  home.packages = with pkgs.gnomeExtensions; [
    todotxt
  ];
}
