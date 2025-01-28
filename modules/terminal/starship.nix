_: {
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.starship.settings = {
    # ------------------------------
    # -           Format           -
    # ------------------------------
    # We use a left + right layout, all on one line

    # left is just git and the prompt
    format = builtins.replaceStrings [ "\n" ] [ "" ] ''
      ''${custom.no_git}$git_status
      $directory
      [ ](fg:dark)
    '';

    # right is tags for extra info
    right_format = builtins.replaceStrings [ "\n" ] [ "" ] ''
      ( [](fg:dark)$cmd_duration[](fg:dark))
      ( [](fg:dark)$git_branch[](fg:dark))
      ( [](fg:dark)
      $c$crystal$dart$elixir$elm$erlang$golang$haskell
      $java$julia$kotlin$lua$nim$nodejs$ocaml$perl$php
      $python$rust$scala
      [](fg:dark))
      ( [](fg:dark)$conda[](fg:dark))
      ( [](fg:dark)$package[](fg:dark))
    '';

    continuation_prompt = "[   ](bg:light) ";

    # as it's one line, we don't need a newline in front
    add_newline = false;

    # ------------------------------
    # -          Palettes          -
    # ------------------------------
    # We use a rough tokyo palette for the prompt itself

    palette = "tokyo";

    palettes.tokyo = {
      folder = "#769ff0";
      light = "#3e4450";
      dark = "#333842";
      positive = "bright-green";
      negative = "bright-red";
    };

    # ------------------------------
    # -           Prompt           -
    # ------------------------------
    # all the modules used in our prompt:
    # - git status combined with a folder icon
    # - a basic path layout

    custom.no_git = {
      when = "! git status";
      format = "[ 󰉋 ](fg:folder bg:light)";
    };

    git_status = {
      format = "[ $ahead_behind ](fg:folder bg:light)";
      # this one's a 'custom' rather than a 'md', but looks roughly right
      up_to_date = "";
      ahead = "󱧰 [$count](fg:positive bg:light)";
      diverged = builtins.replaceStrings [ "\n" ] [ "" ] ''
        [$ahead_count](fg:positive bg:light)
        󱧱
        [$behind_count](fg:negative bg:light)
      '';
      behind = "󱧨 [$count](fg:negative bg:light)";
    };

    directory = {
      truncation_length = 2;
      format = "[ $path ](bg:dark)";
    };

    # if you want any more, add them here
    directory.substitutions = { };

    # ------------------------------
    # -            Tags            -
    # ------------------------------
    # all modules used for tags
    # - (optional) command duration
    # - (optional) git branch of directory
    # - (optional) coding language for directory
    # - (optional) package version for directory

    cmd_duration.format = "[󰔛 $duration]($style bg:dark)";

    git_branch.format = "[$symbol($branch)(:$remote_branch)]($style bg:dark)";

    package = {
      symbol = " ";
      format = "[$symbol($version)]($style bg:dark)";
    };

    # ------------------------------
    # -        Language Tag        -
    # ------------------------------
    # all modules used for language tags
    # current languages: [
    #   c, crystal, dart, elixir, elm, erlang, golang,
    #   haskell, java, julia, kotlin, lua, nim, nodejs,
    #   ocaml, perl, php, python, rust, scala
    # ]

    c = {
      symbol = " ";
      format = "[$symbol($version)]($style bg:dark)";
    };

    crystal = {
      symbol = " ";
      format = "[$symbol($version)]($style bg:dark)";
    };

    dart = {
      symbol = " ";
      format = "[$symbol($version)]($style bg:dark)";
    };

    elixir = {
      symbol = " ";
      format = "[$symbol($version)]($style bg:dark)";
    };

    elm = {
      symbol = " ";
      format = "[$symbol($version)]($style bg:dark)";
    };

    erlang = {
      symbol = " ";
      format = "[$symbol($version)]($style bg:dark)";
    };

    golang = {
      symbol = " ";
      format = "[$symbol($version)]($style bg:dark)";
    };

    haskell = {
      symbol = " ";
      format = "[$symbol($version)]($style bg:dark)";
    };

    java = {
      symbol = " ";
      format = "[$symbol($version)]($style bg:dark)";
    };

    julia = {
      symbol = " ";
      format = "[$symbol($version)]($style bg:dark)";
    };

    kotlin = {
      symbol = " ";
      format = "[$symbol($version)]($style bg:dark)";
    };

    lua = {
      symbol = "󰢱 ";
      format = "[$symbol($version)]($style bg:dark)";
    };

    nim = {
      symbol = " ";
      format = "[$symbol($version)]($style bg:dark)";
    };

    nodejs = {
      symbol = " ";
      format = "[$symbol($version)]($style bg:dark)";
    };

    ocaml = {
      symbol = " ";
      format = "[$symbol($version)]($style bg:dark)";
    };

    perl = {
      symbol = " ";
      format = "[$symbol($version)]($style bg:dark)";
    };

    php = {
      symbol = " ";
      format = "[$symbol($version)]($style bg:dark)";
    };

    python = {
      symbol = " ";
      format = "[$symbol$pyenv_prefix($version )(\\($virtualenv\\))]($style bg:dark)";
    };

    rust = {
      symbol = " ";
      format = "[$symbol($version)]($style bg:dark)";
    };

    scala = {
      symbol = " ";
      format = "[$symbol($version)]($style bg:dark)";
    };

    # ------------------------------
    # -      Environment Tag       -
    # ------------------------------
    # all modules used for environment tags

    conda.format = "[$symbol($environment)]($style bg:dark)";
  };
}
