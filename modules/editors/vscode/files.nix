{
  programs.vscode.mutUserSettings = {
    "files.exclude" = {
      "**/.git" = true;
      "**/.svn" = true;
      "**/.hg" = true;
      "**/CVS" = true;
      "**/.DS_Store" = true;
      "**/Thumbs.db" = true;
      "**/node_modules" = true;
      "**/.svelte-kit" = true;
    };
    "explorer.confirmDelete" = false;

    # stop vscode watching *so many* files
    "files.watcherExclude" = {
      "**/.git/objects/**" = true;
      "**/.git/subtree-cache/**" = true;
      "**/node_modules/*/**" = true;
      "**/target/**" = true;
    };
  };
}
