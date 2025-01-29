_: {
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
    history.path = "$ZDOTDIR/.history";

    # automatic tooling
    autocd = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      reload = "source $ZDOTDIR/.zshrc";
      nixos-update = "nixos-rebuild switch --use-remote-sudo --upgrade --flake $NIXOS_CONFIG#default";
      nixos-config = "$EDITOR $NIXOS_CONFIG";
    };
  };
}
