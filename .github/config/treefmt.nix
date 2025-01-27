{ ... }:
{
  projectRootFile = "flake.nix";
  settings.global.excludes = [ "README.md" ];

  programs.nixfmt.enable = true;
}
