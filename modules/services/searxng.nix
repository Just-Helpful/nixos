# SearXNG module by cybardev:
# https://github.com/cybardev/nix-channel/blob/06247a3c9edb748dc0a27937d53ee19fc143c310/mod/searxng/default.nix
{
  config,
  pkgs,
  lib ? pkgs.lib,
  ...
}:
let
  cfg = config.services.searxng;

  jsonFmt = pkgs.formats.json { };

  # NOTE: YAML is a JSON superset so SearXNG can read JSON settings files too.
  # If some value does not work as expected, file a bug report on this repository.
  settingsFile = jsonFmt.generate "settings.json" cfg.settings;

  envVars = {
    SEARXNG_SETTINGS_PATH = "${settingsFile}";
    SEARXNG_SECRET = builtins.hashString "md5" "${settingsFile}";
  };
in
{
  options = {
    services.searxng = {
      enable = lib.mkEnableOption "SearXNG service for the meta search engine";

      package = lib.mkPackageOption pkgs "searxng" { };

      settings = lib.mkOption {
        inherit (jsonFmt) type;
        default = {
          use_default_settings = true;
        };
        example = {
          use_default_settings = true;
          general.debug = false;
          search = {
            safe_search = 2;
            formats = [ "html" ];
          };
          server = {
            port = 8888;
            bind_address = "127.0.0.1";
          };
        };
        description = ''
          Options to add to the {file}`settings.yml` file.

          See [documentation](https://docs.searxng.org/admin/settings/index.html) for defaults and available configuration options.
        '';
      };
    };
  };
  config = lib.mkIf cfg.enable {
    home.packages = [ cfg.package ];

    home.sessionVariables = envVars;

    systemd.user.services.searxng = lib.mkIf pkgs.stdenv.isLinux {
      Unit = {
        Description = "Service for the SearXNG meta search engine";
        After = [ "network.target" ];
      };
      Service = {
        Type = "simple";
        Restart = "always";
        RestartSec = 1;
        ExecStart = lib.getExe' cfg.package "searxng-run";
        Environment = lib.mapAttrsToList (name: value: "${name}=${value}") envVars;
      };
      Install = {
        WantedBy = [ "default.target" ];
      };
    };

    launchd.agents.searxng = lib.mkIf pkgs.stdenv.isDarwin {
      enable = true;
      config = {
        ProgramArguments = [
          (lib.getExe' cfg.package "searxng-run")
        ];
        EnvironmentVariables = envVars;
        KeepAlive = {
          Crashed = true;
          SuccessfulExit = false;
        };
        ProcessType = "Background";
        StandardOutPath = "${config.home.homeDirectory}/Library/Logs/searxng.log";
        StandardErrorPath = "${config.home.homeDirectory}/Library/Logs/searxng.error.log";
        RunAtLoad = true;
      };
    };
  };
}
