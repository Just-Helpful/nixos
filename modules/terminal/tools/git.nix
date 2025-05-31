{ config, ... }:
{
  programs.git = {
    enable = true;
    userName = "Alex Colby";
    userEmail = "alexdcolby@pm.me";
    signing = {
      key = "${config.home.homeDirectory}/.ssh/ssh_key.pub";
      format = "ssh";
      signByDefault = true;
    };
    aliases = {
      undo = "reset HEAD~";
      graph = "log --graph --oneline --decorate --all";
    };

    ignores = [
      # Always ignore .env files, it'd be a security risk to include them
      "**/.env"
      # Allow a directory for temporary / scrap work
      "scratch/"
    ];

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
      branch.sort = "-committerdate";

      # use url shortcuts for common repositories
      url = {
        "ssh://git@github.com/".insteadOf = "github:";
        "ssh://git@gitlab.com/".insteadOf = "gitlab:";
      };
    };
  };
}
