# A bit of an ugly shim to allow vscode to always be able
# to access environment variables, no matter whether it's
# being run from a terminal or a GUI.
{
  pkgs,
  config,
  ...
}:
let
  sessionFile = "${config.home.profileDirectory}/etc/profile.d/hm-session-vars.sh";
in
{
  programs.vscode.package = pkgs.vscode.overrideAttrs (pkg: {
    # Manually include `home.sessionVariables` environment variables for vscode's use
    # this only includes `home.sessionVariables`, not **all** environment variables
    desktopItems = builtins.map (
      item:
      item.override (prev: {
        exec = "sh -c \"source ${sessionFile} && ${prev.exec}\"";
      })
    ) pkg.desktopItems;
  });
}
