# types from the `nvf` library
{ lib, ... }:
let
  inherit (lib.options) mkOption;
  inherit (lib.types) submodule anything;
in
{
  /*
    opts is a attrset of options, example:
    ```
    mkPluginSetupOption "telescope" {
      file_ignore_patterns = mkOption {
        description = "...";
        type = types.listOf types.str;
        default = [];
      };
      layout_config.horizontal = mkOption {...};
    }
    ```
  */
  mkPluginSetupOption =
    pluginName: opts:
    mkOption {
      description = ''
        Option table to pass into the setup function of ${pluginName}

        You can pass in any additional options even if they're
        not listed in the docs
      '';

      default = { };
      type = submodule {
        freeformType = anything;
        options = opts;
      };
    };
}
