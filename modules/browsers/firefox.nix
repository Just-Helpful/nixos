{
  pkgs,
  ...
}:
{
  programs.firefox = {
    enable = true;

    profiles.alexc = {
      search = {
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
                template = "https://noogle.dev/q?term=mkEnableOption";
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
        };
      };
    };

    policies = {
      DisablePocket = true;
      DisplayBookmarksToolbar = "newtab";

      ExtensionSettings = {
        # Behind The Overlay
        "jid1-Y3WfE7td45aWDw@jetpack" = {
          installation_mode = "normal_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/behind_the_overlay/latest.xpi";
        };
        # FoxyTab
        "foxytab@eros.man" = {
          installation_mode = "normal_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/foxytab/latest.xpi";
        };
        # Proton Pass
        "78272b6fa58f4a1abaac99321d503a20@proton.me" = {
          installation_mode = "normal_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/proton-pass/latest.xpi";
        };
        # Tabliss
        "extension@tabliss.io" = {
          installation_mode = "normal_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/tabliss/latest.xpi";
        };
      };
    };
  };
}
