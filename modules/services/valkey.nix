# SearXNG module by cybardev:
# https://github.com/cybardev/nix-channel/blob/06247a3c9edb748dc0a27937d53ee19fc143c310/mod/searxng/default.nix
{
  config,
  pkgs,
  lib ? pkgs.lib,
  ...
}:
let
  cfg = config.services.valkey;

  jsonFmt = pkgs.formats.json { };

  settingsFile = jsonFmt.generate "settings.json" cfg.settings;

  envVars = {
    SEARXNG_SETTINGS_PATH = "${settingsFile}";
    SEARXNG_SECRET = builtins.hashString "md5" "${settingsFile}";
  };
in
{
  options = {
    services.valkey = {
      enable = lib.mkEnableOption "Valkey service for in memory caching";

      package = lib.mkPackageOption pkgs "valkey" { };

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
