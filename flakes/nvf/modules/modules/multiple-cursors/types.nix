# There's some pretty heavy duty types we need to construct here.
# (hence my decision to split this into a separate module)
#
# The two heavy duty types defined are:
# 1. vim modes: "n", "i" or "x" with custom merging
# 2. unique grouped lists via a key function
{ lib }:
let
  inherit (lib.types)
    enum
    either
    nonEmptyListOf
    listOf
    ;

  vimMode = enum [
    "n"
    "i"
    "x"
  ];
  vimModes = (either vimMode (nonEmptyListOf vimMode)) // {
    merge =
      _: defs:
      lib.pipe defs [
        (builtins.foldl' (modes: { value, ... }: modes ++ builtins.toList value) [ ])
        (modes: if builtins.length modes == 1 then builtins.head modes else modes)
      ];
  };

  /*
    Merges a single keyed value with existing conflicts.
    This will error in the case of a value conflict between files.

    ## Arguments

    - `conflicts`: existing conflicts between groups of keys and the files they occured in
    - `file`: the file that contains the new value definition
    - `value`: the value that was defined in an option
    - `key`: the key assignable to the given value

    ## Type

    ```
    mergeKey ::
      { ... :: { file :: Path; value :: a } }
      -> { file :: Path; value :: a; key :: String }
      -> { ... :: { file :: Path; value :: a } }
    ```
  */
  mergeKey =
    conflicts:
    {
      file,
      value,
      key,
    }:
    if builtins.hasAttr key conflicts then
      throw ''
        Conflict between unique entries in:
        1. ${file}
        2. ${conflicts.${key}.file}
        with values:
        1. ${value}
        2. ${conflicts.${key}.value}
      ''
    else
      conflicts // { ${key} = { inherit file value; }; };

  /*
    Merges grouped list definitions with existing grouped conflicts.

    ## Arguments

    - `keysFunc`: a function used to generate groups of keys to check for conflicts
    - `loc`: the path segments of the option to be merged, i.e. `["vim" "keybinds"]`
    - `defs` the grouped list definitions to be merged

    ## Type

    ```
    mmergeGroupedList ::
      (a -> String)
      -> [String]
      -> [{ file :: Path; value :: a }]
      -> [a]
    ```
  */
  mergeGroupedList =
    keysFunc: loc: defs:
    lib.pipe defs [
      (builtins.addErrorContext ''
        whilst merging definitions for ${builtins.concatStringsSep "." loc}
      '')
      (builtins.concatMap (
        { file, value }:
        builtins.map (group: {
          inherit file;
          value = group;
        }) value
      ))
      (builtins.concatMap (
        { file, value }:
        builtins.map (key: {
          inherit file value key;
        }) (keysFunc value)
      ))
      (builtins.foldl' (mergeKey keysFunc) { })
      (_: builtins.concatMap ({ value, ... }: value) defs)
    ];

  /*
    A list of entries that produce unique keys under `keysFunc`.
    An example of this would be `vim` keybindings, which should be unique, independant of modes.

    ## Arguments

    - `elemType`: the entries within the list for which force uniqueness under `keysFunc`
    - `keysFunc`: the function used to generate keys to check uniqueness for
  */
  listOfGroups = elemType: keysFunc: (listOf elemType) // { merge = mergeGroupedList keysFunc; };
in
{
  inherit vimModes listOfGroups;
}
