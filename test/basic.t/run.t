  $ ../../main.exe input.re -o actual.mlx
  $ diff -u output.mlx actual.mlx

  $ ../../main.exe input.re > actual-positional.mlx
  $ diff -u output.mlx actual-positional.mlx

  $ ../../main.exe input.re -o - > actual-stdout.mlx
  $ diff -u output.mlx actual-stdout.mlx

  $ grep -E '\[@(JSX|explicit_arity)' actual.mlx
  [1]
