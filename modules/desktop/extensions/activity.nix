{ pkgs, ... }:
{
  home.packages = with pkgs; [ gnomeExtensions.caffeine ];
}
