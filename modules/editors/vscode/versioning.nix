{
  programs.vscode.mutUserSettings = {
    "git.autofetch" = true;
    "git.autoStash" = false;
    "git.confirmSync" = false;
    "git.rebaseWhenSync" = true;
    "git.enableSmartCommit" = true;
    "git.allowForcePush" = true;
    "git.closeDiffOnOperation" = true;
    "git.enableCommitSigning" = true;
    "git.useCommitInputAsStashMessage" = false;
  };

  programs.vscode.mutUserTasks = [
    {
      label = "Open Git Graph";
      command = "\${command:git-graph.view}";
    }
    {
      label = "Pin Tab";
      command = "\${command:workbench.action.pinEditor}";
    }
    {
      label = "Pin Git Graph";
      dependsOrder = "sequence";
      dependsOn = [
        "Open Git Graph"
        "Pin Tab"
      ];
      runOptions = {
        runOn = "folderOpen";
      };
    }
  ];
}
