{ pkgs, ... }:
{
  programs.firefox.profiles.alexc.search = {
    force = true;
    default = "ddg";
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
      "Noogle" = {
        urls = [
          {
            template = "https://noogle.dev/q";
            params = [
              {
                name = "term";
                value = "{searchTerms}";
              }
            ];
          }
        ];
        definedAliases = [ "@ng" ];
      };
      "NixOS Options" = {
        urls = [
          {
            template = "https://search.nixos.org/options?channel=unstable";
            params = [
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
        definedAliases = [ "@no" ];
      };
      "Home Manager Options" = {
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
      "Google Scholar" = {
        urls = [
          {
            template = "https://scholar.google.co.uk/scholar";
            params = [
              {
                # set default language to english
                name = "hl";
                value = "en";
              }
              {
                name = "q";
                value = "{searchTerms}";
              }
            ];
          }
        ];
        definedAliases = [ "@gs" ];
      };
    };
  };
}
