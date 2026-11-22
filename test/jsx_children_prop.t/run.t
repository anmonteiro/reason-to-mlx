  $ ../../main.exe input.re -o actual.mlx
  $ diff -u output.mlx actual.mlx
  $ mlx-pp -print-ml actual.mlx > /dev/null
