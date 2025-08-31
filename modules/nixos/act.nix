{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ act ];

  virtualisation.docker.enable = true;
}
