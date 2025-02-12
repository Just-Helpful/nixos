_: {
  imports = [
    ../themes/fonts.nix
  ];

  programs.vscode = {
    enable = true;
    userSettings = {
      "terminal.integrated.fontFamily" = "MesloLGL Nerd Font";
      "workbench.colorTheme" = "Atom One Dark";
    };
  };
}
