{ lib, ... }:
let
  inherit (lib.options) mkOption mkEnableOption;
  inherit (lib.types)
    nonEmptyListOf
    either
    oneOf
    nullOr
    bool
    str
    submodule
    luaInline
    lines
    ;
  inherit (import ./nvf-types.nix { inherit lib; }) mkPluginSetupOption;
  inherit (import ./types.nix { inherit lib; }) vimModes listOfGroups;

  custom_key_map = submodule {
    options = {
      mode = mkOption {
        type = vimModes;
        example = [
          "n"
          "i"
          "x"
        ];
        description = "The vim modes the keymap should be bound in";
      };

      key = mkOption {
        type = either str (nonEmptyListOf str);
        example = "<Leader>a";
        description = "The keybind to map to the given multicursor action";
      };

      action = mkOption {
        type = luaInline;
        example = ''
          function(register, count, motion_cmd, char)
            vim.print(register .. count .. motion_cmd .. char)
          end
        '';
        description = lib.literalMD ''
          The lua function to execute when the keybind is pressed.
          Within this function:
          - [`register`](https://neovim.io/doc/user/vvars.html#v%3Aregister): the name of the current register
          - [`count`](https://neovim.io/doc/user/vvars.html#v%3Acount): the number of times the action was applied
          - `motion_cmd`: the motion command requested (i.e. `3w`, `l` or `5k`)
            - this will only be included for keybinds with `inputs = "m"`
          - `char`: the additional character requested (i.e. `g`, `%` or any other printable character)
            - this will only be included for keybinds with `inputs = "c"`
        '';
      };

      inputs = mkOption {
        type = nullOr (oneOf [
          "m"
          "c"
          "mc"
        ]);
        example = [
          "m"
          "c"
          "mc"
        ];
        default = null;
        description = lib.literalMD ''
          Any additional input required after the key binding.
          - `"m"`: requires a movement command (i.e. `3w`, `l` or `5k`)
          - `"c"`: requires an additional character (i.e. `g`, `%` or any other printable character)
          The required inputs will be passed as an argument to `keybind.action`
        '';
      };
    };
  };
in
{
  options.vim.utility.multiple-cursors = {
    enable = mkEnableOption "vscode like multiple cursors [multiple-cursors.nvim]";

    setupOpts = mkPluginSetupOption "multicursors" {
      remove_in_opposite_direction = mkOption {
        type = bool;
        default = true;
        description = lib.literalMD ''
          When enabled, if `MultipleCursorsAddDown` is used to add a cursor,
          then `MultipleCursorsAddUp` will remove it and vice-versa.
        '';
      };

      enable_split_paste = mkOption {
        type = bool;
        default = true;
        description = lib.literalMD ''
          When the number of lines in pasted text matches the current number of cursors
          paste each line of the text at each cursor.
        '';
      };

      match_visible_only = mkOption {
        type = bool;
        default = true;
        description = lib.literalMD ''
          When adding cursors based on a text search, only add cursors to matches in the visible buffer.
        '';
      };

      pre_hook = mkOption {
        type = lines;
        example = [ "vim.opt.cursorline = false" ];
        default = "";
        description = lib.literalMD ''
          Code called before entering multiple cursor mode.
          This can be used to disable any plugins / features that conflict with mutiple cursors.
        '';
      };

      post_hook = mkOption {
        type = lines;
        example = [ "vim.opt.cursorline = true" ];
        default = "";
        description = lib.literalMD ''
          Code called after exiting multiple cursor mode.
          This can be used to re-enable any plugins / features that conflict with multiple cursors.
        '';
      };

      custom_key_maps = mkOption {
        type = listOfGroups custom_key_map (
          { mode, key, ... }:
          lib.pipe mode [
            builtins.toList
            (builtins.map (mode: "${mode},${key}"))
          ]
        );
        example = [
          {
            mode = "n";
            key = "<Leader>a";
            action = "function(register, count) vim.print(register .. count) end";
          }
        ];
        default = [ ];
        description = lib.literalMD ''
          Keybindings from a key sequence in a vim mode to lua code.
          Additional inputs may be requested via the optional `inputs` key.
          See the keybindings documentation for more information on keys.
        '';
      };
    };
  };
}
