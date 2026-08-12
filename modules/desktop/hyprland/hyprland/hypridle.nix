{
  pkgs,
  lib,
  config,
  ...
}:

{
  options = {
    hypridle.enable = lib.mkEnableOption "enables hypridle";
  };

  config = lib.mkIf config.hypridle.enable {
    services.hypridle = {
      enable = true;
    };
  };
}
