{ pkgs, ... }:
{
  home.packages = with pkgs; [ rclone ];

  # Set up a mounted directory for backups
  # You'll need to set up an rclone remote called `Backups` for this.
  systemd.user.services.rclone-mount-backups = {
    Unit.Description = "Mount ~/Backups directory on startup";
    Install.WantedBy = [ "default.target" ];
    Service.ExecStart = "${pkgs.writeShellScript "rclone-mount-backups" ''
      #!/run/current-system/sw/bin/bash
      ${pkgs.rclone}/bin/rclone mount --allow-non-empty --vfs-cache-mode writes Backups:Backups /home/alexc/Backups
    ''}";
  };
}
