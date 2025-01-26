{ pkgs, ... }:
{
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [ pkgs.nerd-fonts.meslo-lg ];
}
