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

    # Primarily used to make nixos config updates easier
    initExtra = ''
      # Updates the versions of packages in `flake.lock`
      nixup-flake() {
        nix flake update --flake $NIXOS_CONFIG
        git -C $NIXOS_CONFIG commit flake.lock -m "chore: updates \`flake.lock\`" > /dev/null
      }

      # Updates the nixos config used to build
      nixup-config() {
        nixos-rebuild switch --use-remote-sudo --upgrade --flake $NIXOS_CONFIG#default
      }
    '';

    shellAliases = {
      reload = "source $ZDOTDIR/.zshrc";
      nixrc = "$EDITOR $NIXOS_CONFIG";
      nixup = "nixup-flake && nixup-config";
    };
  };

  programs.nix-your-shell.enable = true;
}
