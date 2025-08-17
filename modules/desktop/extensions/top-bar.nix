{ pkgs, ... }:
{
  home.packages = with pkgs.gnomeExtensions; [
    open-bar
  ];

  dconf.enable = true;
  dconf.settings = {
    "org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = with pkgs.gnomeExtensions; [
        open-bar.extensionUuid
      ];
    };

    "org/gnome/shell/extensions/openbar" = {
      bartype = "Trilands";
      margin = 0;

      # Transparent background, like nvim
      bgalpha = 0.7;
      isalpha = 0.7;

      # Match borders on apps
      bwidth = 1;
      bradius = 12;
      bcolor = [
        "0.239"
        "0.220"
        "0.275"
      ];
      iscolor = [
        "0.239"
        "0.220"
        "0.275"
      ];
      neon = false;

      # Match highlights around apps
      autohg-bar = false;
      dark-hcolor = [
        "0.208"
        "0.518"
        "0.894"
      ];
      heffect = true;

      # Don't let open bar fiddle with menus
      menustyle = false;
    };
  };
}
