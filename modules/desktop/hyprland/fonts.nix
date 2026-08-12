{
  pkgs,
  lib,
  config,
  ...
}:

{
  options = {
    fonts.enable = lib.mkEnableOption "enables fonts";
  };

  config = lib.mkIf config.fonts.enable {
    # Packages that should be installed to the user profile.
    home.packages = with pkgs; [ nerd-fonts.jetbrains-mono ];

    # Enable configuring fonts
    fonts.fontconfig.enable = true;
  };
}
