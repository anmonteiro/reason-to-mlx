A three-stage chain that ends by passing a lambda to the last stage, and
that lambda's own body is a second, independent pipe chain. Flattening the
outer chain must not disturb the inner one.

  $ ../../main.exe input.re -o actual.mlx
  $ diff -u output.mlx actual.mlx
