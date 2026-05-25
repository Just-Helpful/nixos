{ config, ... }:
{
  imports = [
    ./search.nix
    ./extensions.nix
  ];

  programs.firefox = {
    enable = true;
    configPath = "${config.xdg.configHome}/mozilla/firefox";

    policies = {
      DisablePocket = true;
      DisableFirefoxAccounts = true;
      DisplayBookmarksToolbar = "newtab";
    };
  };
}
