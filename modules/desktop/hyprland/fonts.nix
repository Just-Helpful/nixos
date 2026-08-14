{
  pkgs,
  ...
}:
{
  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [ nerd-fonts.jetbrains-mono ];

  # Enable configuring fonts
  fonts.fontconfig.enable = true;
}
