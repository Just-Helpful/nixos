{ config, ... }:
{
  imports = [
    ../../themes/fonts.nix
    ../../utils/file.nix
  ];

  home.mutFile = {
    "${config.xdg.configHome}/Code/User/settings.json" = {
      text = builtins.toJSON {
        "terminal.integrated.fontFamily" = "MesloLGL Nerd Font";
        "workbench.colorTheme" = "Atom One Dark";
      };
    };
  };
}
