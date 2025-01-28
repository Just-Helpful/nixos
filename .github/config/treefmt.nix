_: {
  projectRootFile = "flake.nix";
  settings.global.excludes = [ "README.md" ];
  settings.global.on-unmatched = "info";

  programs.nixfmt.enable = true;
}
