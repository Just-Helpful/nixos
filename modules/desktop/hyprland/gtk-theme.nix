{
  pkgs,
  lib,
  config,
  ...
}:

{
  options = {
    gtk-theme.enable = lib.mkEnableOption "enables gtk-theme";
  };

  config = lib.mkIf config.gtk-theme.enable {
    home.pointerCursor = {
      package = pkgs.adwaita-icon-theme;
      name = "Adwaita";
      size = 30;
    };

    gtk = {
      enable = true;
      font = {
        name = "Quicksand";
        size = 14;
        package = pkgs.quicksand;
      };

      theme = {
        name = "Catppuccin-GTK-Dark";
        package = pkgs.magnetic-catppuccin-gtk;
      };

      # iconTheme = {
      #   name = "Adwaita";
      #   package = pkgs.adwaita-icon-theme;
      # };

      cursorTheme = {
        name = "Adwaita";
        package = pkgs.adwaita-icon-theme;
      };
    };
  };
}
