{ pkgs, ... }:
{
  home.packages = with pkgs; [ librewolf-bin ];
}
