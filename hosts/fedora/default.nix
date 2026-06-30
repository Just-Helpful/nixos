{ config, pkgs, ... }:
let
  git = "${pkgs.gitMinimal}/bin/git";
in
{
  imports = [
    ../../modules/desktop
    ../../modules/editors
    ../../modules/languages
    ../../modules/terminal

    # enable the config for some apps
    ../../modules/applications/dictionary.nix
    ../../modules/applications/kitty.nix
    ../../modules/applications/localsend.nix
    ../../modules/applications/minecraft.nix
    ../../modules/applications/music.nix
    ../../modules/applications/notes.nix

    # add systemd service modules
    ../../modules/services/searxng.nix
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
      export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/lib64"
      nu
    '';
  };

  home.stateVersion = "24.11";

  # Enable auto-update
  services.home-manager.autoUpgrade = {
    enable = true;
    frequency = "weekly";

    useFlake = true;
    flakeDir = "${config.xdg.configHome}/nixos";

    preSwitchCommands = [
      "${git} pull"
      "nix flake update"
      "${git} commit -m \"chore: updates \\`flake.lock\\`\""
      "${git} push"
    ];
  };

  # And some services
  services.searxng.enable = true;
services.ollama.enable = true;
}
