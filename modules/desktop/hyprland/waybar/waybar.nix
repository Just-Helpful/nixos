{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    waybar.enable = lib.mkEnableOption "enables waybar";
  };

  config = lib.mkIf config.waybar.enable {

    home.packages = with pkgs; [
      pavucontrol
      playerctl
      wlogout
    ];

    services.network-manager-applet.enable = true;
    services.blueman-applet.enable = true;

    programs.waybar = {
      enable = true;
      systemd.enable = true;
      style = builtins.readFile ./style.css;

      settings = [
        {
          layer = "top";
          position = "top";
          margin-bottom = 0;
          padding-bottom = 0;

          modules-left = [
            "hyprland/workspaces"
            "hyprland/submap"
          ];
          modules-center = [ ];
          modules-right = [
            "cpu"
            "memory"
            "disk"
            "pulseaudio"
            # "bluetooth"
            "battery"
            "clock"
            "tray"
            "custom/power"
          ];

          "hyprland/workspaces" = {
            disable-scroll = true;
            sort-by-name = true;
            format = "{name}";
          };

          "hyprland/submap" = {
            "format" = "{}";
            "tooltip" = true;
          };

          cpu = {
            interval = 5;
            format = "{usage}%   ";
          };

          memory = {
            interval = 10;
            format = "{percentage}% ({used:0.1f}G)   ";
            format-alt = "{percentage}% {used:0.1f}G/{total:0.1f}G ({swapUsed:0.1f}G/{swapTotal:0.1f}G)  ";
          };

          disk = {
            interval = 30;
            format = "{percentage_used}% ({free})   ";
            unit = "GB";
          };

          bluetooth = {
            format = "{status} ";
            format-connected = "{device_alias} ";
            format-connected-battery = "{device_alias} ({device_battery_percentage}%) ";
            tooltip-format = ''
              {controller_alias} {controller_address}

              {num_connections} connected'';
            tooltip-format-connected = ''
              {controller_alias} {controller_address}

              {num_connections} connected

              {device_enumerate}'';
            tooltip-format-enumerate-connected = "{device_alias}	{device_address}";
            tooltip-format-enumerate-connected-battery = "{device_alias}	{device_address}	{device_battery_percentage}%";
            on-click = "blueman-manager";
          };

          "custom/music" = {
            format = "{} ";
            escape = true;
            interval = 5;
            tooltip = false;
            exec = "playerctl metadata --format='{{ title }}'";
            on-click = "playerctl play-pause";
            max-length = 50;
          };

          battery = {
            states = {
              warning = 20;
              critical = 5;
            };
            format = "{capacity}% {icon}";
            format-charging = "{capacity}% {icon}";
            format-plugged = "{capacity}% {icon}";
            format-alt = "{capacity}%  {power} {time} {icon}";
            format-icons = [
              " "
              " "
              " "
              " "
              " "
            ];
          };

          pulseaudio = {
            format = "{volume}% {icon}";
            format-muted = "MUT   ";
            format-icons = {
              default = [
                " "
                "  "
                "  "
              ];
            };
            on-click = "pavucontrol";
          };

          clock = {
            timezone = "Europe/London";
            tooltip-format = ''
              <big>{:%Y %B}</big>
              <tt><small>{calendar}</small></tt>'';
            format-alt = "{:%d/%m/%Y}";
            format = "{:%H:%M %d/%m/%Y}";
          };

          tray = {
            spacing = 7;
          };

          "custom/power" = {
            tooltip = false;
            on-click = "wlogout &";
            format = "";
          };
        }
      ];
    };
  };
}
