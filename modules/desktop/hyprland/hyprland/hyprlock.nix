{
  pkgs,
  lib,
  config,
  ...
}:

{
  options = {
    hyprlock.enable = lib.mkEnableOption "enables hyprlock";
  };

  config = lib.mkIf config.hyprlock.enable {
    programs.hyprlock = {
      enable = true;
      settings = {
        background = {
          path = "screenshot";
          blur_passes = 3;
          blur_size = 7;
          brightness = 0.8;
          contrast = 0.8;
        };
      };
    };
  };
}
