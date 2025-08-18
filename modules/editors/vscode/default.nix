{
  lib,
  pkgs,
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
    ./desktop-fix.nix
    ./editors.nix
    ./files.nix
    ./languages
    ./visuals.nix
    ./versioning.nix
  ];

  options.programs.vscode = {
    mutUserSettings = lib.options.mkOption {
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

    mutUserTasks = lib.options.mkOption {
      inherit (jsonFormat) type;
      default = { };
      example = lib.options.literalExpression ''
        [
          {
            type = "shell";
            label = "Hello task";
            command = "hello";
          }
        ];
      '';
      description = ''
        Configuration written to Visual Studio Code's
        {file}`tasks.json`.
      '';
    };
  };

  config = {
    programs.vscode.enable = true;

    programs.git.ignores = [ "**/.vscode/" ];

    home.mutFile = {
      "${config.xdg.configHome}/Code/User/settings.json".source =
        jsonFormat.generate "vscode-mut-user-settings" cfg.mutUserSettings;

      "${config.xdg.configHome}/Code/User/tasks.json".source =
        jsonFormat.generate "vscode-mut-user-tasks"
          {
            version = "2.0.0";
            tasks = cfg.mutUserTasks;
          };
    };
  };
}
