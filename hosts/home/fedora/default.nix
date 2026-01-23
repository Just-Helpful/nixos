{
  imports = [
    ../../../modules/desktop
    ../../../modules/editors
    ../../../modules/languages
    ../../../modules/terminal

    # enable the config for some apps
    ../../../modules/applications/kitty.nix
  ];

  # but then disable the packages as we're running into GPU issues
  programs.kitty.package = null;

  home = {
    username = "default";
    homeDirectory = "/home/default";
  };

  programs.home-manager.enable = true;
  targets.genericLinux.enable = true;

  programs.bash = {
    enable = true;
    bashrcExtra = ''
      # support python user installs
      export PATH="$HOME/.local/bin:$PATH"
      nu
    '';
  };

  home.stateVersion = "24.11";
}
