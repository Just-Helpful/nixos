{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.programs.rustfmt;

  settingsFormat = pkgs.formats.toml { };
  settingsFile = settingsFormat.generate "rustfmt.toml" cfg.settings;
  settingsLoc = "${config.home.homeDirectory}/.config/rustfmt/rustfmt.toml";
in
{
  options.programs.rustfmt = {
    enable = lib.mkEnableOption (lib.mdDoc "`rustfmt` formatter config");

    settings = lib.mkOption {
      inherit (settingsFormat) type;
      default = { };
      description = lib.mdDoc ''
        Configuration included in `rustfmt.toml`.

        See [`rustfmt` config](https://github.com/rust-lang/rustfmt/blob/master/Configurations.md) for documentation.
      '';
    };
  };

  config = lib.mkIf cfg.enable {
    home.file.${settingsLoc}.source = settingsFile;
  };
}
