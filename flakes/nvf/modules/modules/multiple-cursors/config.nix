{
  config,
  lib,
  ...
}:
let
  inherit (lib.modules) mkIf;
  cfg = config.vim.utility.multiple-cursors;
in
{
  config = mkIf cfg.enable {
    vim = {
      startPlugins = [ "hydra-nvim" ];
      lazy.plugins."multiple-cursors-nvim" = {
        package = "multiple-cursors-nvim";
        setupModule = "multicursors";
        setupOpts = {
          inherit (cfg.setupOpts)
            remove_in_opposite_direction
            enable_split_paste
            match_visible_only
            custom_key_maps
            ;

          pre_hook = ''
            function()
              ${lib.mkLuaInline cfg.setupOpts.pre_hook}
            end
          '';
          post_hook = ''
            function()
              ${lib.mkLuaInline cfg.setupOpts.post_hook}
            end
          '';
        };

        event = [ "DeferredUIEnter" ];
        cmd = [
          "MultipleCursorsAddDown"
          "MultipleCursorsAddUp"
          "MultipleCursorsMouseAddDelete"
          "MultipleCursorsVisualArea"
          "MultipleCursorsAddMatches"
          "MultipleCursorsAddMatchesV"
          "MultipleCursorsAddJumpNextMatch"
          "MultipleCursorsJumpNextMatch"
          "MultipleCursorsAddJumpPrevMatch"
          "MultipleCursorsJumpPrevMatch"
        ];
        keys = [
          # These default keybinds honestly conflict pretty nastily.
          # I might want to change them, but they're pretty fundamental to how I work with large files.
          {
            mode = [
              "n"
              "i"
              "v"
            ];
            key = "<leader>mcs";
            action = "<cmd>MultipleCursorsAddDown<cr>";
            desc = "Create a selection for selected text or word under the cursor [multicursors.nvim]";
          }
          {
            mode = [
              "v"
              "n"
            ];
            key = "<leader>mcp";
            action = "<cmd>MultipleCursorsAddMatches<cr>";
            desc = "Create a selection for pattern entered [multicursors.nvim]";
          }
        ];
      };
    };
  };
}
