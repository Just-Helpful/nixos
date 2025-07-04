{ pkgs, ... }:
{
  home.packages = with pkgs; [ deja-dup ];
}
