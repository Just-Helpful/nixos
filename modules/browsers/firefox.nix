{
  pkgs,
  ...
}:
{
  programs.firefox = {
    enable = true;

    policies.DisablePocket = true;

    profiles.alexc = {
      search = {
        force = true;
        default = "DuckDuckGo";
        engines = {
          "Nix Packages" = {
            urls = [
              {
                template = "https://search.nixos.org/packages";
                params = [
                  {
                    name = "type";
                    value = "packages";
                  }
                  {
                    name = "channel";
                    value = "unstable";
                  }
                  {
                    name = "query";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "@np" ];
          };
          "Home Options" = {
            urls = [
              {
                template = "https://home-manager-options.extranix.com";
                params = [
                  {
                    name = "release";
                    value = "master";
                  }
                  {
                    name = "query";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
            definedAliases = [ "@ho" ];
          };
          "Github" = {
            urls = [
              {
                template = "https://github.com/search";
                params = [
                  {
                    name = "type";
                    value = "repositories";
                  }
                  {
                    name = "q";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
            definedAliases = [ "@gh" ];
          };
        };
      };
    };
  };
}
