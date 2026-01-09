{
  imports = [
    ../../../modules/desktop
    ../../../modules/editors
    ../../../modules/languages
    ../../../modules/terminal
  ];

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
