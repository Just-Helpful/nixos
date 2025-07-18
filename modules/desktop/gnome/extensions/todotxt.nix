{ pkgs, ... }:
{
  home.packages = with pkgs.gnomeExtensions; [
    todotxt
  ];

  dconf.enable = true;
  dconf.settings."org/gnome/shell" = {
    disable-user-extensions = false;
    enabled-extensions = with pkgs.gnomeExtensions; [
      todotxt.extensionUuid
    ];
  };

  dconf.settings = {
    "org/gnome/shell/extensions/TodoTxt" = {
      group-by = 1;
      show-number-of-group-elements = false;
      add-creation-date = true;
      hide-if-pattern-zero = 1;
      truncate-long-tasks = true;
    };
  };
}
