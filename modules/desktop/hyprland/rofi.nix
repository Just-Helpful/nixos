{
  pkgs,
  lib,
  config,
  ...
}:

{
  options = {
    rofi.enable = lib.mkEnableOption "enables rofi";
  };

  config = lib.mkIf config.rofi.enable {
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
  };
}
