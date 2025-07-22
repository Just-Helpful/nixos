{ config, pkgs, ... }:
{
  home.packages = with pkgs; [ ntfy ];

  programs.zsh = {
    enable = true;

    inherit (config.home) sessionVariables;

    # config files
    dotDir = ".config/zsh/";
    history.path = "$ZDOTDIR/.history";

    # automatic tooling
    autocd = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;

    # Primarily used to make nixos config updates easier
    initContent = ''
      # Updates the versions of packages in `flake.lock`
      nixup-flake() {
        nix flake update --flake $NIXOS_CONFIG
        git -C $NIXOS_CONFIG commit flake.lock -m "chore: updates \`flake.lock\`" > /dev/null || true
      }

      # Updates the nixos config used to build
      nixup-config() {
        sudo nixos-rebuild switch --upgrade --flake $NIXOS_CONFIG#default
        ntfy send -t "NixUp" "Nix update complete"
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
