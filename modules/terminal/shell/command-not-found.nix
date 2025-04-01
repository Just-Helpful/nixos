{ inputs, pkgs, ... }:
let
  sqlite-packages = inputs.programs-sqlite.packages.${pkgs.system};
in
{
  programs.command-not-found = {
    enable = true;
    dbPath = sqlite-packages.programs-sqlite;
  };
}
