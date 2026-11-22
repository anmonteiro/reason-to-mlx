`react.component`, `react.client.component`, and `react.async.component`
all move from the `let` binding's suffix position to its prefix position,
the same as any other prefix-printed attribute.

  $ ../../main.exe input.re -o actual.mlx
  $ diff -u output.mlx actual.mlx
