{ inputs, pkgs, ... }:
let
  sqlite-packages = inputs.programs-sqlite.packages.${pkgs.stdenv.hostPlatform.system};
in
{
  programs.command-not-found = {
    enable = true;
    dbPath = sqlite-packages.programs-sqlite;
  };
}
