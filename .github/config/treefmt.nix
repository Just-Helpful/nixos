{
  projectRootFile = "flake.nix";
  settings.global.excludes = [
    "README.md"
    "**/hardware.nix"
  ];
  settings.global.on-unmatched = "info";

  programs.nixfmt.enable = true;
}
