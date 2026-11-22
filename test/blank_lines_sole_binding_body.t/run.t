A binding followed by a blank line as the whole function body: ocamlformat-mlx
lays it out on one line with the blank line after it. `let` and `let*` print the
same way. After another statement the layout is regular.

  $ ../../main.exe input.re -o actual.mlx
  $ diff -u output.mlx actual.mlx
