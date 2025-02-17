{
  pkgs,
  options,
  config,
  ...
}:
let
  cfg = config.programs.vscode;
  jsonFormat = pkgs.formats.json { };
in
{
  imports = [
    ../../utils/file.nix
    ./files.nix
    ./languages.nix
    ./visuals.nix
  ];

  options.programs.vscode.mutUserSettings = options.programs.vscode.userSettings;

  config = {
    programs.vscode = {
      enable = true;
    };

    programs.git.ignores = [ "**/.vscode/" ];

    home.mutFile = {
      "${config.xdg.configHome}/Code/User/settings.json".source =
        jsonFormat.generate "vscode-mut-user-settings" cfg.mutUserSettings;
    };
  };
}
