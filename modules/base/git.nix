{ ... }: {
  programs.git = {
    enable = true;
    userName = "Alex Colby";
    userEmail = "alexanderdcolby@gmail.com";
    signing = {
      key = null;
      signByDefault = true;
    };

    extraConfig = {
      # merge by default
      pull.rebase = false;

      # start on "main" branch
      init.defaultBranch = "main";

      # automatically add branches when pushing
      push.autoSetupRemote = true;
      push.default = "current";

      # nice colouring and line numbers while diffing
      diff.colorMoved = "default";
      core.line-numbers = true;

      # better automatic merging; honestly it's a bit hard to explain,
      # see the [git docs](https://git-scm.com/book/en/v2/Git-Tools-Rerere)
      rerere.enabled = true;

      # have the most recent branches on top when changing branch
      sort = "-committerdate";
    };
  };

  programs.gh = {
    enable = true;
    gitCredentialHelper.enable = true;
  };
}
