{
  lib,
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
    ./editors.nix
    ./files.nix
    ./languages.nix
    ./visuals.nix
  ];

  options.programs.vscode.mutUserSettings = lib.options.mkOption {
    inherit (jsonFormat) type;
    default = { };
    example = lib.options.literalExpression ''
      {
        "files.autoSave" = "off";
        "[nix]"."editor.tabSize" = 2;
      }
    '';
    description = ''
      Configuration written to Visual Studio Code's
      {file}`settings.json`.
    '';
  };

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
