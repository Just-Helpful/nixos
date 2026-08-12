{ pkgs, version, ... }:

{
  home.stateVersion = version;
  programs.home-manager.enable = true;

  home.username = "andrea";
  home.homeDirectory = "/home/andrea";

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "image/jpeg" = "swayimg.desktop";
      "image/png" = "swayimg.desktop";
      "image/tiff" = "swayimg.desktop";
    };
  };

  catppuccin = {
    enable = true;
    flavor = "mocha";
    nvim.enable = false;
    rofi.enable = true;
  };

  # Core
  home.packages =
    with pkgs;
    [
      gnumake
      zip
      xz
      unzip
      p7zip
      jq
      which
      tree
      gnupg
      htop
      bottom
      btop
      wget
      curl
      xclip
    ]
    ++ [
      # Desktop
      pcmanfm
      darktable
      shotwell
    ];

  zsh.enable = true;
  neovim.enable = true;
  git.enable = true;
  kitty.enable = true;
  fzf.enable = true;
  fonts.enable = true;
  gh.enable = true;
  yazi.enable = true;
  starship.enable = true;
  direnv.enable = true;
  llm-local.enable = true;
  opencode.enable = true;
  github-copilot-cli.enable = true;
  gemini-cli.enable = true;
  tmux.enable = true;

  # Desktop
  hyprland.enable = true;
  firefox.enable = true;
  vlc.enable = true;
  rofi.enable = true;
  waybar.enable = true;
  dunst.enable = true;
  pass.enable = true;
  gtk-theme.enable = true;
  flameshot.enable = true;
  swayimg.enable = true;
}
