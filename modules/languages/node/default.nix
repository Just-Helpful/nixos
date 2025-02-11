{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nodejs_latest
    pnpm
  ];
}
