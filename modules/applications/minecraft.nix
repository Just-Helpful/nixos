{ pkgs, ... }:
{
  imports = [
    ../utils/nixGL
  ];

  home.packages = with pkgs; [
    (pkgs.wrapWithNixGLIntel prismlauncher)
    glfw3-minecraft
  ];
}
