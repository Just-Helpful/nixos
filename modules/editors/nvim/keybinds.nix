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
        action = "<cmd>w<cr>";
        desc = "Save buffer";
      }

      # Buffer navigation
      {
        key = "<S-Left>";
        mode = [
          "n"
          "i"
        ];
        action = "<cmd>bprevious<cr>";
        silent = true;
        desc = "Prev Buffer";
      }
      {
        key = "<S-Right>";
        mode = [
          "n"
          "i"
        ];
        action = "<cmd>bnext<cr>";
        silent = true;
        desc = "Next Buffer";
      }
      {
        key = "<S-w>";
        mode = [
          "n"
        ];
        action = "<cmd>lua MiniBufremove.delete()<cr>";
      }

      # Moving lines
      {
        key = "<A-Up>";
        mode = [
          "n"
          "i"
        ];
        action = "<cmd>m-2<cr>";
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
        action = "<cmd>yank z<cr><up><cmd>put z<cr>";
        silent = true;
        desc = "Copy Line Up";
      }
      {
        key = "<A-S-Down>";
        mode = [
          "n"
          "i"
        ];
        action = "<cmd>yank z<cr><cmd>put z<cr>";
        silent = true;
        desc = "Copy Line Down";
      }
    ];
  };
}
