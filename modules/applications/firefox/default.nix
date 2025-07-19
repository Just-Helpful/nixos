{
  imports = [
    ./search.nix
    ./extensions.nix
  ];

  programs.firefox = {
    enable = true;

    policies = {
      DisablePocket = true;
      DisplayBookmarksToolbar = "newtab";
    };
  };
}
