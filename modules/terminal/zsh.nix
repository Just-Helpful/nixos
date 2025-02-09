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
        # Step 1. Stash any existing changes
        git -C $NIXOS_CONFIG stash push

        # Step 2. `flake lock` and commit changes
        nix flake update --flake $NIXOS_CONFIG
        git -C $NIXOS_CONFIG add flake.lock
        git -C $NIXOS_CONFIG commit -m "chore: updates \`flake.lock\`"

        # Step 3. Restore stashed changes
        git -C $NIXOS_CONFIG stash pop
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
