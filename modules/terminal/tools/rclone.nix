{
  pkgs,
  config,
  lib,
  ...
}:
let
  cfg = config.programs.rclone;
in
{
  options = {
    programs.rclone = {
      backup-service = {
        enable = lib.mkEnableOption "mounting a backup directory via rclone";
        mount_path = lib.mkOption {
          type = lib.types.str;
          default = "/home/alexc/Backups";
          description = "Path at which to mount the backups directory";
        };
      };
    };
  };

  config = lib.mkIf cfg.enable {
    # Set up a mounted directory for backups
    # You'll need to set up an rclone remote called `Backups` for this.
    systemd.user.services.rclone-mount-backups = lib.mkIf cfg.backup-service.enable {
      Unit.Description = "Mount ~/Backups directory on startup";
      Install.WantedBy = [ "default.target" ];
      Service.ExecStart = "${pkgs.writeShellScript "rclone-mount-backups" ''
        #!/run/current-system/sw/bin/bash
        ${pkgs.rclone}/bin/rclone mount --allow-non-empty --vfs-cache-mode writes Backups:Backups ${cfg.backup-service.mount_path}
      ''}";
    };
  };
}
