A comment on its own line between two parameters of a function header stays
on its own line before the parameter it leads, not on the end of the previous
parameter's line.

  $ ../../main.exe input.re -o actual.mlx
  $ diff -u output.mlx actual.mlx
