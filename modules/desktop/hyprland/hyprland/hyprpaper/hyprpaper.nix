{
  pkgs,
  lib,
  config,
  ...
}:

{
  options = {
    hyprpaper.enable = lib.mkEnableOption "enables hyprpaper";
  };

  config = lib.mkIf config.hyprpaper.enable {
    services.hyprpaper = {
      enable = true;
      settings = {
        splash = false;
        preload = "${
          ../../../wallpapers/stormtrooper-star-wars-black-background-amoled-3840x2160-8296.png
        }";
        wallpaper = [
          {
            monitor = "";
            path = "${../../../wallpapers/stormtrooper-star-wars-black-background-amoled-3840x2160-8296.png}";
          }
        ];
      };
    };
  };
}
