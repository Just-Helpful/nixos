{ config, ... }:
{
  programs.nushell = {
    enable = true;

    environmentVariables = config.home.sessionVariables;

    settings = {
      show_banner = false;
    };

    # If you ever move the config from ~/.config/nixos
    # You'll either need to modify `$env.NIXOS_CONFIG`
    # or overwrite the variable temporarily via "NIXOS_CONFIG=..."
    extraConfig = ''
      $env.NIXOS_CONFIG = $"($env.HOME)/.config/nixos"

      # Updates the versions of packages in `flake.lock`
      def nixup-flake [] {
        nix flake update --flake $env.NIXOS_CONFIG
        try { git -C $env.NIXOS_CONFIG commit flake.lock -m "chore: updates `flake.lock`" }
      }

      # Updates the nixos config used to build
      def nixup-config [] {
        nixos-rebuild switch --use-remote-sudo --upgrade --flake $"($env.NIXOS_CONFIG)#default"
      }

      # Updates the complete nixos config
      def nixup [] {
        nixup-flake
        nixup-config
      }

      # Edit the nixos config
      def nixrc [] {
        bash -c $"$EDITOR ($env.NIXOS_CONFIG)"
      }

      # # Handling autocompletion
      let carapace_completer = {|spans| 
        carapace $spans.0 nushell ...$spans | from json
      }
      $env.config.completions.external = {
        enable: true
        completer: $carapace_completer
      }

      # # Handling command not found
      # This one's copy pasted straight from the nushell docs:
      # https://www.nushell.sh/book/hooks.html#command-not-found-hook-in-nixos
      $env.config.hooks.command_not_found = {|command_name|
        print (command-not-found $command_name | str trim)
      }
    '';
  };

  programs.carapace = {
    enable = true;
    enableNushellIntegration = true;
  };
  programs.nix-your-shell.enable = true;
}
