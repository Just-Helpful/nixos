{ config, ... }:
{
  home.sessionVariables = {
    # If you ever move the config from ~/.config/nixos
    # You'll either need to modify this line
    # or overwrite the variable temporarily via "NIXOS_CONFIG=..."
    NIXOS_CONFIG = "$HOME/.config/nixos";
  };

  programs.zsh = {
    enable = true;

    # config files
    dotDir = ".config/zsh/";
    history.path = "~/.config/zsh/.history";

    # automatic tooling
    autocd = true;
    autosuggestion.enable = true;
    enableCompletion = true;

    shellAliases = {
      nixos-config = "$EDITOR $NIXOS_CONFIG";
      nixos-update = "nixos-rebuild switch --use-remote-sudo --upgrade --flake $NIXOS_CONFIG#default";
    };
  };
}
