# Hotkeys
_: {
  programs.nvf.enable = true;
  programs.nvf.settings.vim = {
    binds = {
      whichKey.enable = true;
      cheatsheet.enable = true;
    };

    keymaps = [
      # Buffer management
      {
        key = "<C-s>";
        mode = [
          "n"
          "i"
        ];
        action = "<cmd>w<CR>";
        desc = "Save buffer";
      }

      # Buffer navigation
      {
        key = "<A-Left>";
        mode = [
          "n"
          "i"
        ];
        action = "<cmd>bprevious<CR>";
        silent = true;
        desc = "Prev Buffer";
      }
      {
        key = "<A-Right>";
        mode = [
          "n"
          "i"
        ];
        action = "<cmd>bnext<CR>";
        silent = true;
        desc = "Next Buffer";
      }

      # Moving lines
      {
        key = "<A-Up>";
        mode = [
          "n"
          "i"
        ];
        action = "<cmd>m-2<CR>";
        silent = true;
        desc = "Move Line Up";
      }
      {
        key = "<A-Down>";
        mode = [
          "n"
          "i"
        ];
        action = "<cmd>m+<CR>";
        silent = true;
        desc = "Move Line Down";
      }
    ];
  };
}
