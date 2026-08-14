{
  pkgs,
  lib,
  config,
  ...
}:
let
  storePath = "${config.home.homeDirectory}/.password-store";
in
{
  programs.password-store = {
    enable = true;
    package = pkgs.pass-wayland.withExtensions (
      exts: with exts; [
        pass-otp
        pass-import
        pass-audit
      ]
    );
    settings.PASSWORD_STORE_DIR = storePath;
  };

  services.pass-secret-service = {
    inherit storePath;
    enable = true;
  };
}
