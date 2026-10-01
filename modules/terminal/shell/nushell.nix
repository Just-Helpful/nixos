{ config, ... }:
{
  programs.nushell = {
    enable = true;

    environmentVariables = config.home.sessionVariables;

    settings = {
      show_banner = false;
    };

    # If you ever move the config from ~/.config/nixos
    # You'll either need to modify `$env.NIX_CONFIG_PATH`
    # or overwrite the variable temporarily via "NIX_CONFIG_PATH=..."
    extraConfig = ''
      # Updates the versions of packages in `flake.lock`
      def nixup-flake [] {
        nix flake update --flake $env.NIX_CONFIG_PATH
        try { git -C $env.NIX_CONFIG_PATH commit flake.lock -m "chore: updates `flake.lock`" }
      }

      # Updates the nixos config used to build
      def nixup-config [] {
        sudo nixos-rebuild switch --flake $"($env.NIX_CONFIG_PATH)#($env.NIX_CONFIG_NAME)"
      }

      # Updates the complete nixos config
      def nixup [] {
        nixup-flake
        nixup-config
      }

      # Edit the nixos config
      def nixrc [] {
        bash -c $"$EDITOR ($env.NIX_CONFIG_PATH)"
      }

      # Updates the versions of packages in home manager `flake.lock`
      def homeup-flake [] {
        nix flake update --flake $env.NIX_CONFIG_PATH
        try { git -C $env.NIX_CONFIG_PATH commit flake.lock -m "chore: updates `flake.lock`" }
      }

      # Updates the home-manager config
      def homeup-config [] {
        home-manager switch --flake $"($env.NIX_CONFIG_PATH)#($env.NIX_CONFIG_NAME)"
      }

      # Updates the complete home manager config
      def homeup [] {
        homeup-flake
        homeup-config
      }

      # Edit the home manager config
      def homerc [] {
        bash -c $"$EDITOR ($env.NIX_CONFIG_PATH)"
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
      # This one's from the nushell docs
      # but with some decently heavy parsing and rebuilding
      # to provide a significantly nicer UI
      $env.config.hooks.command_not_found = {|command_name|
        let raw_pkgs = command-not-found $command_name e>| $in
          | parse --regex "nix-shell -p (?P<name>.*)"

        if ($raw_pkgs | is-empty) {
          return null
        }
        
        let ranked_pkgs = $raw_pkgs
          | insert dist {|$pkg|
            $pkg.name
            | split row "."
            | last
            | str distance $command_name
          }
          | insert len {|$pkg|
            $pkg.name | str length
          }
          | uniq
          | sort-by -c {|$pkg0, $pkg1|
            if $pkg0.dist < $pkg1.dist {
              return true
            }
            if $pkg0.dist > $pkg1.dist {
              return false
            }
            $pkg0.len < $pkg1.len
          }
          | get name
        
        let pretty_pkgs = $ranked_pkgs
          | first 3
          | each {|pkg| $"`($pkg)`" }
          | str join ", "
        
        $"available nixpkgs: ($pretty_pkgs)"
      }
    '';
  };

  programs.carapace = {
    enable = true;
    enableNushellIntegration = true;
  };

  programs.nix-your-shell.enable = true;
}
