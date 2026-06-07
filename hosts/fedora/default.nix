{ config, pkgs, ... }:
let
  git = "${pkgs.gitMinimal}/bin/git";
in
{
  imports = [
    ../../../modules/desktop
    ../../../modules/editors
    ../../../modules/languages
    ../../../modules/terminal

    # enable the config for some apps
    ../../../modules/applications/kitty.nix
    ../../../modules/applications/dictionary.nix
    ../../../modules/applications/minecraft.nix
    ../../../modules/applications/music.nix
    ../../../modules/applications/notes.nix

    # add systemd service modules
    ../../../modules/services/searxng.nix
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

  # Enable auto-update with default frequency (weekly)
  services.home-manager.autoUpgrade = {
    enable = true;
    useFlake = true;
    flakeDir = "${config.xdg.configHome}/nixos";

    preSwitchCommands = [
      "${git} pull"
      "nix flake update"
      "${git} commit -m 'chore: updates `flake.lock`'"
      "${git} push"
    ];
  };

  # And SearXNG for search
  services.searx.enable = true;
}
