{
  pkgs,
  lib,
  config,
  ...
}:
{
  imports = [
    # ./hyprpaper/hyprpaper.nix
    ./hyprlock.nix
    ./hypridle.nix
  ];

  options = {
    hyprland.enable = lib.mkEnableOption "enables hyprland";
  };

  config = lib.mkIf config.hyprland.enable {
    waybar.enable = lib.mkDefault true;
    rofi.enable = lib.mkDefault true;
    # hyprpaper.enable = lib.mkDefault true;
    hyprlock.enable = lib.mkDefault true;
    hypridle.enable = lib.mkDefault true;
    dunst.enable = lib.mkDefault true;

    home.packages = with pkgs; [
      brightnessctl
      zathura
      adwaita-icon-theme
    ];

    wayland.windowManager.hyprland = {
      enable = true;
      xwayland.enable = true;
      systemd.variables = [ "--all" ];

      settings = {
        env = [
          # Get a decent cursor
          "HYPRCURSOR_THEME,Adwaita"
          "HYPRCURSOR_SIZE,30"
          "XCURSOR_THEME,Adwaita"
          "XCURSOR_SIZE,30"
        ];

        exec-once = [ "hyprpaper" ];
        exec = [ "systemctl restart --user hyprpolkitagent" ];

        monitor = [
          "eDP-1,highres@highrr,0x0,1"
          # "desc:Samsung Electric Company U32J59x HNMW300479,highres@highrr,auto-up,1"
          "desc:Samsung Electric Company U32J59x HNMW300479,1920x1080,auto-up,1"
          # "DP-1,1366x768@59.79Hz,auto-up,1"
          ",highres@highrr,auto-left,1"
        ];

        workspace = [
          "1,persistent:true,monitor:desc:Samsung Electric Company U32J59x HNMW300479,default:true"
          "2,monitor:desc:Samsung Electric Company U32J59x HNMW300479"
          "3,monitor:desc:Samsung Electric Company U32J59x HNMW300479"
          "4,monitor:desc:Samsung Electric Company U32J59x HNMW300479"
          "5,monitor:desc:Samsung Electric Company U32J59x HNMW300479"
          "6,monitor:desc:Samsung Electric Company U32J59x HNMW300479"

          "7,persistent:true,monitor:desc:Sharp Corporation 0x1449"
          "8,monitor:desc:Sharp Corporation 0x1449"
          "9,monitor:desc:Sharp Corporation 0x1449"
          "0,monitor:desc:Sharp Corporation 0x1449"
        ];

        "$mod" = "Alt";

        general = {
          layout = "master";
          border_size = 3;
          resize_on_border = true;
          no_focus_fallback = true;
          snap.enabled = true;
          hover_icon_on_border = false;
          extend_border_grab_area = 20;
          gaps_in = 10;
          gaps_out = "5,20,20,20";
        };

        decoration = {
          rounding = 5;
          blur = {
            enabled = true;
            size = 5;
            passes = 3;
            new_optimizations = "on";
            ignore_opacity = "off";
          };
        };

        animations = {
          enabled = true;
          bezier = [
            "easeOutQuint,0.23,1,0.32,1"
            "easeInOutCubic,0.65,0.05,0.36,1"
            "linear,0,0,1,1"
            "almostLinear,0.5,0.5,0.75,1.0"
            "quick,0.15,0,0.12,1"
          ];

          animation = [
            "global, 1, 2, quick"
            "windows, 1, 2, easeOutQuint, slide"
            "windowsIn, 1, 2, easeOutQuint, popin"
            "windowsOut, 1, 2, quick, popin"
            "windowsMove, 1, 2, quick, slide"
            "fadeIn, 1, 2, easeOutQuint"
            "fadeOut, 1, 2, quick"
            "fadeSwitch, 1, 2, easeOutQuint"
            "fadeShadow, 1, 2, easeOutQuint"
            "fadeDim, 1, 2, easeOutQuint"
            "border, 1, 1, easeOutQuint"
            "borderangle, 1, 1, easeOutQuint"
            "workspaces, 1, 2, easeOutQuint, slide"
            "layers, 1, 2, easeOutQuint, slide"
          ];
        };

        input = {
          repeat_rate = 25;
          repeat_delay = 400;
          follow_mouse = 2;
          touchpad.natural_scroll = true;
        };

        binds = {
          workspace_center_on = 1;
        };

        cursor = {
          inactive_timeout = 2;
          enable_hyprcursor = true;
        };

        render = {
          new_render_scheduling = true;
        };

        windowrule = [
          "match:class Rofi, float on"
          "match:class feh, float on"
          "match:class .blueman-manager-wrapped, float on"
          "match:class org.pulseaudio.pavucontrol, float on"
          "match:class nm-connection-editor, float on"
          "match:class GParted, float on"
          "match:class flameshot, float on"
          "match:title float_this, float on"
        ];

        bind = [
          "$mod,RETURN,exec,kitty"

          "$mod,d,exec,rofi -show drun"
          "$mod SHIFT,d,exec,rofi -show run"
          "$mod,p,exec,rofi-pass"

          "$mod,F,fullscreen,"

          "$mod SHIFT,h,movewindow,l"
          "$mod SHIFT,l,movewindow,r"
          "$mod SHIFT,k,movewindow,u"
          "$mod SHIFT,j,movewindow,d"

          "$mod,h,movefocus,l"
          "$mod,l,movefocus,r"
          "$mod,k,movefocus,u"
          "$mod,j,movefocus,d"
          "$mod,1,workspace,1"
          "$mod,2,workspace,2"
          "$mod,3,workspace,3"
          "$mod,4,workspace,4"
          "$mod,5,workspace,5"
          "$mod,6,workspace,6"
          "$mod,7,workspace,7"
          "$mod,8,workspace,8"
          "$mod,9,workspace,9"
          "$mod,0,workspace,10"

          "$mod SHIFT,1,movetoworkspace,1"
          "$mod SHIFT,2,movetoworkspace,2"
          "$mod SHIFT,3,movetoworkspace,3"
          "$mod SHIFT,4,movetoworkspace,4"
          "$mod SHIFT,5,movetoworkspace,5"
          "$mod SHIFT,6,movetoworkspace,6"
          "$mod SHIFT,7,movetoworkspace,7"
          "$mod SHIFT,8,movetoworkspace,8"
          "$mod SHIFT,9,movetoworkspace,9"
          "$mod SHIFT,0,movetoworkspace,10"

          "$mod,q,killactive,"

          ",XF86MonBrightnessDown, exec, brightnessctl s 10%-"
          ",XF86MonBrightnessUp, exec, brightnessctl s +10%"

          ",XF86PowerOff, exec, hyprlock"
        ];

        bindel = [
          ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
          ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ];
        bindl = [
          ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
          ", XF86AudioPlay, exec, playerctl play-pause"
          ", XF86AudioPrev, exec, playerctl previous"
          ", XF86AudioNext, exec, playerctl next"
        ];

        bindm = [ "$mod, mouse:272, movewindow" ];
      };

      extraConfig = lib.concatStrings [
        ''
          # window resize
          bind = $mod, r, submap, resize

          submap = resize
          binde = , l, resizeactive, 10 0
          binde = , h, resizeactive, -10 0
          binde = , k, resizeactive, 0 -10
          binde = , j, resizeactive, 0 10
          bind = , escape, submap, reset
          submap = reset
        ''
      ];
    };
  };
}
