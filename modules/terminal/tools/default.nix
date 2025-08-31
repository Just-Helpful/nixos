# # Command Line tools
# These tools provide the basis for command line manipulation.
# I'll be expanding it when I encounter a use case either in the raw command line
# or in the nvim editor, after I've tried them out via `nix-shell`
{ pkgs, ... }:
{
  imports = [
    ./fzf.nix
    ./git.nix
    ./ssh.nix
  ];

  programs.rclone.enable = true;

  home.packages = with pkgs; [
    ripgrep
    yq-go
  ];
}
