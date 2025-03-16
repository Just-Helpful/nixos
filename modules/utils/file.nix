# # Mutable Home manager files
#
# Allows for files installed by nix to be modified
# I'm fully aware this a cardinal sin in nix, but
# some software (looking at you vscode...) will attempt
# to write to the config and error if they can't.
#
# Inspired by a Github [comment][workaround] by Warm Cyan.
#
# [workaround]: https://github.com/nix-community/home-manager/issues/3090#issuecomment-1835357162
{
  lib,
  options,
  config,
  ...
}:
let
  cfg = config.home.mutFile;
in
{
  imports = [ ./attrs.nix ];

  # Accept the same options as files
  options.home.mutFile = options.home.file;

  config = {
    home.file = cfg;
    home.activation = config.lib.attrset.flatMapAttrs (
      path:
      {
        target ? path,
        ...
      }:
      let
        name = builtins.baseNameOf target;
      in
      {
        # Remove the link to prevent nix build errors
        "rm-link-home/${target}" = lib.hm.dag.entryBefore [ "checkLinkTargets" ] ''
          rm -rf "$HOME/${target}"
        '';

        # Replace link with copy
        # This is where the nasty, non-nix stuff happens
        "add-cp-home/${target}" = lib.hm.dag.entryAfter [ "linkGeneration" ] ''
          # mktemp that works on both linux and mac
          tmpdir=$(mktemp -d 2>/dev/null || mktemp -d -t 'mytmpdir')

          # Perform the replacement with the temp directory
          cp -r "$HOME/${target}" "$tmpdir/${name}"
          rm -rf "$HOME/${target}"
          cp -rL "$tmpdir/${name}" "$HOME/${target}"
          rm -rf $tmpdir 2>/dev/null || true
        '';
      }
    ) cfg;
  };
}
