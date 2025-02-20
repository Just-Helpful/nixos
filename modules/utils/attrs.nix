{
  lib.attrset = rec {
    /**
      Performs the opposite of `builtins.listToAttrs`
      by converting an attribute set to a list of `{name = ..., value = ...}`

      # Example

      ```nix
      attrsToList { a = "5"; b = 6; }
      =>
      [
        { name = "a"; value = "5"; }
        { name = "b"; value = 6; }
      ]
      ```
    */
    attrsToList =
      attrs:
      builtins.map (k: {
        name = k;
        value = attrs.${k};
      }) (builtins.attrNames attrs);

    /**
      An extended version of `builtins.mapAttrs`

      This allows for:
      1. renaming of keys in output
      2. outputting of more / less keys

      # Example

      Renaming keys in output

      ```nix
      flatMapAttrs (
        k: v: {"${k}*2" = v * 2;}
      ) { a = 5; b = 2; }
      =>
      { "a*2" = 10; "b*2" = 4; }
      ```

      Outputting more keys in output

      ```nix
      flatMapAttrs (
        k: v: {"${k}4" = v * 10 + 4; "${k}7" = v * 10 + 7}
      ) { a = 5; b = 2; }
      =>
      { a4 = 54; a7 = 57; b4 = 24; b7 = 27 }
      ```

      Outputting less keys in output

      ```nix
      flatMapAttrs (
        k: v: if (v / 2) * 2 == v
          then {${k} = v;}
          else {}
      ) { a = 5; b = 2; }
      =>
      { b = 2; }
      ```
    */
    flatMapAttrs =
      f: attrs:
      builtins.listToAttrs (
        builtins.concatMap ({ name, value }: attrsToList (f name value)) (attrsToList attrs)
      );
  };
}
