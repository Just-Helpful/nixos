{ pkgs, ... }:
{
  home.packages = with pkgs.beam28Packages; [
    elixir
    elixir-ls
  ];
}
