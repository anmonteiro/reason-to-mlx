Without an associative-operator declaration, preserve the call grouping.

  $ ../../main.exe input.re -o output.actual.mlx
  $ diff -u output.mlx output.actual.mlx

Configured associative operators can use flatter grouping.

  $ ../../main.exe --associative-operators=+++ input.re -o output_associative.actual.mlx
  $ diff -u output_associative.mlx output_associative.actual.mlx
