{ pkgs, ... }:
{
  home.packages = with pkgs; [ uv ];

  # disable double prompt for venvs
  programs.nushell.extraConfig = ''
    $env.VIRTUAL_ENV_DISABLE_PROMPT = true;
  '';
}
