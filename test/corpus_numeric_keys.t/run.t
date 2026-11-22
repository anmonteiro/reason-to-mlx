A JS object literal with a purely numeric key ("1279", "767") has no valid
OCaml field name. The converter stops and names the key and the Reason line.

  $ ../../main.exe input.re -o input.actual.mlx
  reason-to-mlx: input.re:5: object key "1279" has no valid OCaml field name
  [124]

A `Js.Dict.t` value has no field names, so it converts cleanly.

  $ ../../main.exe fixed.re -o fixed.actual.mlx
  $ diff -u fixed.mlx fixed.actual.mlx
