An object type field named like a keyword converts. One with no OCaml
spelling is refused with its line.

  $ ../../main.exe ok.re
  type t = < \#type : int ; a : string > Js.t

  $ ../../main.exe hyphen.re
  reason-to-mlx: hyphen.re:2: object type field "b-c" has no OCaml spelling
  [124]

  $ ../../main.exe hyphen.rei
  reason-to-mlx: hyphen.rei:1: object type field "a-b" has no OCaml spelling
  [124]
