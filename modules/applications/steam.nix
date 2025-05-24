{ pkgs, ... }:
{
  imports = [ ../utils/nixGL ];

  home.packages = with pkgs; [
    (pkgs.wrapWithNixGLIntel steam)
  ];
}
