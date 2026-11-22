A quoted phrase that a run of `//` lines splits across two lines prints as one
block comment, so its quotes are not doubled. A `(* ... *)` that is balanced
inside a `//` comment stays a nested comment, without spaces in `(*` and `*)`.

  $ ../../main.exe input.re -o actual.mlx
  $ diff -u output.mlx actual.mlx
