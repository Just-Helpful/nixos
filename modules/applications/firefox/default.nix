{ config, ... }:
{
  imports = [
    ./search.nix
    ./extensions.nix
  ];

  programs.firefox = {
    enable = true;
    programs.firefox.configPath = "${config.xdg.configHome}/mozilla/firefox";

    policies = {
      DisablePocket = true;
      DisableFirefoxAccounts = true;
      DisplayBookmarksToolbar = "newtab";
    };
  };
}
