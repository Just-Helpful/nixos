{
  programs.rofi = {
    enable = true;
    location = "center";
    extraConfig = {
      modi = "run,drun";
      show-icons = true;
      terminal = "kitty";
      drun-display-format = "{icon} {name}";
      disable-history = false;
      hide-scrollbar = true;
      display-drun = "   Apps ";
      display-run = "   Run ";
    };

    pass = {
      enable = true;
    };
  };

  wayland.windowManager.hyprland.settings = {
    bind = [
      # Execute Rofi with only the SUPER key
      "SUPER, exec, pkill rofi || rofi -show drun"
    ];
  };
}
