{ pkgs, ... }:
{
  home.packages = with pkgs; [
    prismlauncher
    glfw3-minecraft
  ];
}
