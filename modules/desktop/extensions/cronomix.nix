{ config, pkgs, ... }:
let
  jsonFormat = pkgs.formats.json { };
in
{
  home.packages = with pkgs.gnomeExtensions; [
    cronomix
  ];

  dconf.enable = true;
  dconf.settings."org/gnome/shell" = {
    disable-user-extensions = false;
    enabled-extensions = with pkgs.gnomeExtensions; [
      cronomix.extensionUuid
    ];
  };

  # cronomix config is done via `*.json` files in `~/.config`
  home.mutFile."${config.xdg.configHome}/cronomix/global.json".source =
    jsonFormat.generate "cronomix-global"
      {
        values = {
          todo = {
            tag = "boolean";
            value = true;
          };
          alarm = {
            tag = "boolean";
            value = false;
          };
          timer = {
            tag = "boolean";
            value = true;
          };
          pomodoro = {
            tag = "boolean";
            value = false;
          };
          stopwatch = {
            tag = "boolean";
            value = false;
          };
          flashcards = {
            tag = "boolean";
            value = false;
          };
          theme_file = {
            tag = "file";
            value = "";
            start = "${config.xdg.dataHome}/gnome-shell/extensions/${pkgs.gnomeExtensions.cronomix.extensionUuid}/data/themes/";
          };
          lazy_list_page_size = {
            tag = "number";
            value = 20;
            range = [
              1
              100000
            ];
          };
        };
      };
}
