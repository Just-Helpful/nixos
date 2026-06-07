{ pkgs, ... }:
{
  home.packages = with pkgs; [ gapless ];
}
