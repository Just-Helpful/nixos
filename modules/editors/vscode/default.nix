{
  options,
  config,
  ...
}:
{
  imports = [
    ../../utils/file.nix
    ./visuals.nix
  ];

  options.programs.vscode.mutUserSettings = options.programs.vscode.userSettings;

  config = {
    programs.vscode = {
      enable = true;
    };

    home.mutFile = {
      "${config.xdg.configHome}/Code/User/settings.json" = {
        text = builtins.toJSON config.programs.vscode.mutUserSettings;
      };
    };
  };
}
