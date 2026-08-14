{
  pkgs,
  ...
}:
{
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
}
