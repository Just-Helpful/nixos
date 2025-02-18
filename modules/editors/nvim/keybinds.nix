# Hotkeys
{
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
        key = "<S-Left>";
        mode = [
          "n"
          "i"
        ];
        action = "<cmd>bprevious<CR>";
        silent = true;
        desc = "Prev Buffer";
      }
      {
        key = "<S-Right>";
        mode = [
          "n"
          "i"
        ];
        action = "<cmd>bnext<CR>";
        silent = true;
        desc = "Next Buffer";
      }
      {
        key = "<S-w>";
        mode = [
          "n"
        ];
        action = "<cmd>bdelete<CR><cmd>bprevious<CR>";
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

      # Duplicating lines
      {
        key = "<A-S-Up>";
        mode = [
          "n"
          "i"
        ];
        action = "\"zyyk\"zp";
        desc = "Copy Line Up";
      }
      {
        key = "<A-S-Down>";
        mode = [
          "n"
          "i"
        ];
        action = "\"zyy\"zp";
        desc = "Copy Line Down";
      }
    ];
  };
}
