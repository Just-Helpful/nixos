# # Command Line tools
# These tools provide the basis for command line manipulation.
# I'll be expanding it when I encounter a use case either in the raw command line
# or in the nvim editor, after I've tried them out via `nix-shell`
{ pkgs, ... }:
{
  imports = [
    ./git.nix
    ./ssh.nix
  ];

  programs = {
    fzf.enable = true;
    rclone.enable = true;
    direnv.enable = true;
    carapace.enable = true;
    nix-your-shell.enable = true;
  };

  home.packages = with pkgs; [
    ripgrep
    yq-go
    openvpn3
  ];
}
