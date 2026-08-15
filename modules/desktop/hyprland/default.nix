{ pkgs, ... }: {
  imports = [
    # ./dunst.nix
    # ./flameshot.nix
    # ./fonts.nix
    # ./fzf.nix
    # ./git.nix
    # ./gtk-theme.nix
    # ./hyprland
    # ./pass.nix
    ./rofi.nix
    # ./starship.nix
    ./waybar/waybar.nix
    ./kitty.nix
  ];

  wayland.windowManager.hyprland = {
    # Whether to enable Hyprland wayland compositor
    enable = true;
    # The hyprland package to use
    package = pkgs.hyprland;
    # Whether to enable XWayland
    xwayland.enable = true;
    # Whether to enable hyprland-session.target on hyprland startup
    systemd.enable = true;

    configType = "lua";
  };
}
