A comment before a JSX element inside a constructor argument stays before the element.

  $ ../../main.exe input.re -o actual.mlx
  $ diff -u output.mlx actual.mlx
