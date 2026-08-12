{
  lib,
  config,
  ...
}:
{
  options = {
    dunst.enable = lib.mkEnableOption "enables dunst, a notification manager";
  };

  config = lib.mkIf config.dunst.enable {
    services.dunst = {
      enable = true;
    };
  };
}
