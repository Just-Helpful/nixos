{
  imports = [
    ../../../modules/desktop
    ../../../modules/editors
    ../../../modules/languages
    ../../../modules/terminal

    # enable the config for some apps
    ../../../modules/applications/kitty.nix
    ../../../modules/applications/firefox
  ];

  # but then disable the packages as we're running into GPU issues
  programs.kitty.package = null;
  programs.firefox.package = null;

  home = {
    username = "default";
    homeDirectory = "/home/default";
  };

  programs.home-manager.enable = true;
  programs.bash.enable = true;
  targets.genericLinux.enable = true;
  targets.genericLinux.gpu.enable = true;

  home.stateVersion = "24.11";
}
