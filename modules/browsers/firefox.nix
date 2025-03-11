{
  pkgs,
  ...
}:
{
  programs.firefox = {
    enable = true;

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

      SearchEngines = {
        Default = "DuckDuckGo";
        Add = [
          {
            Name = "Nix Packages";
            URLTemplate = "https://search.nixos.org/packages?type=packages&channel=unstable&query={searchTerms}";
            Method = "GET";

            IconURL = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            Alias = "@np";
          }
          {
            Name = "Home Manager Options";
            URLTemplate = "https://home-manager-options.extranix.com?release=master&query={searchTerms}";
            Method = "GET";

            # IconURL = "";
            Alias = "@hmo";
          }
          {
            Name = "GitHub";
            URLTemplate = "https://github.com/search?type=repositories&q={searchTerms}";
            Method = "GET";

            IconURL = "https://github.githubassets.com/favicons/favicon.svg";
            Alias = "@gh";
          }
        ];
      };
    };
  };
}
