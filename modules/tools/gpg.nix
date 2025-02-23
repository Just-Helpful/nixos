{ pkgs, ... }:
{
  programs.gpg = {
    enable = true;
  };

  services.gpg-agent = {
    enable = true;

    enableSshSupport = true;
    sshKeys = [ "E93B7F3586977EA2DB96E07C3501A2E18D0E1464" ];

    enableZshIntegration = true;
    enableNushellIntegration = true;
    pinentryPackage = pkgs.pinentry-gnome3;
  };
}
