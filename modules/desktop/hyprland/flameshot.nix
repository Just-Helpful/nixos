{
  pkgs,
  lib,
  config,
  ...
}:

{
  options = {
    flameshot.enable = lib.mkEnableOption "enables flameshot screenshot tool";
  };

  config = lib.mkIf config.flameshot.enable {
    services.flameshot = {
      enable = true;

      # Necessary to build on wayland
      package = pkgs.flameshot.override { enableWlrSupport = true; };

      settings = {
        General = {
          useGrimAdapter = true;
          disabledGrimWarning = true;
          saveAfterCopy = false;
        };
      };
    };
  };
}
