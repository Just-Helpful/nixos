{ pkgs, ... }:
{
  programs.gpg = {
    enable = true;
  };

  home.sessionVariables = {
    SSH_AUTH_SOCK = "$(gpgconf --list-dirs agent-ssh-sock)";
  };

  services.gpg-agent = {
    enable = true;

    enableSshSupport = true;
    sshKeys = [ "E93B7F3586977EA2DB96E07C3501A2E18D0E1464" ];

    enableZshIntegration = true;
    pinentryPackage = pkgs.pinentry-gnome3;
  };
}
