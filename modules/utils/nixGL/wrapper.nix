inputs: final: prev:
let
  inherit (prev) lib;

  # import nixGL for our wrappers
  nixGL = import inputs.nixgl { pkgs = final; };

  # fetches all binary files for a given package
  getBinFiles =
    pkg:
    lib.pipe "${lib.getBin pkg}/bin" [
      builtins.readDir
      builtins.attrNames
      (builtins.filter (n: builtins.match "^\\..*" n == null))
    ];

  # finds the binary executable for the given wrapper
  wrapperBin =
    wrapper:
    lib.pipe wrapper [
      getBinFiles
      (builtins.filter (n: n == (lib.getName wrapper)))
      builtins.head
      (x: "${wrapper}/bin/${x}")
    ];

  wrapWithNixGL =
    wrapper: package:
    let
      binFiles = getBinFiles package;
      wrapBin =
        name:
        final.writeShellScriptBin name ''
          exec ${wrapperBin wrapper} ${package}/bin/${name} "$@"
        '';
    in
    final.symlinkJoin {
      name = "${package.name}-nixgl";
      paths = (builtins.map wrapBin binFiles) ++ [ package ];
    };

  replacePrefix = builtins.replaceStrings [ "wrapWithNixGL" ] [ "nixGL" ];

  wrappers = lib.genAttrs [
    "wrapWithNixGLNvidia"
    "wrapWithNixGLIntel"
    "wrapWithNixGLDefault"
  ] (name: wrapWithNixGL final.${replacePrefix name});
in
{
  inherit (nixGL) nixGLNvidia nixGLIntel nixGLDefault;
  inherit wrapWithNixGL;
}
// wrappers
# generate wrappers for major nixGL programs
# lib.genAttrs [
#   "wrapWithNixGL"
# ] (name: wrapWithNixGL final.${replacePrefix name})
