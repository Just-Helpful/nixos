{
  programs.nushell = {
    enable = true;

    environmentVariables = {
      # If you ever move the config from ~/.config/nixos
      # You'll either need to modify this line
      # or overwrite the variable temporarily via "NIXOS_CONFIG=..."
      NIXOS_CONFIG = "$HOME/.config/nixos";
    };

    settings = { };

    # automatic tooling
    # autocd = true;
    # autosuggestion.enable = true;
    # enableCompletion = true;

    # Primarily used to make nixos config updates easier
    configFile.source = ./config.nu;
    extraConfig = ''
      # Updates the versions of packages in `flake.lock`
      def nixup-flake[] {
        nix flake update --flake $NIXOS_CONFIG
        git -C $NIXOS_CONFIG commit flake.lock -m "chore: updates \`flake.lock\`" > /dev/null || true
      }

      # Updates the nixos config used to build
      def nixup-config[] {
        nixos-rebuild switch --use-remote-sudo --upgrade --flake $NIXOS_CONFIG#default
      }
    '';

    shellAliases = {
      reload = "source $nu.config-path; source $nu.env-path";
      nixrc = "$EDITOR $NIXOS_CONFIG";
      nixup = "nixup-flake; nixup-config";
    };
  };

  programs.nix-your-shell.enable = true;
}
