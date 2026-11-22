A multi-line comment that the converter moves to another column keeps its
continuation lines aligned with its first line.

  $ ../../main.exe input.re -o actual.mlx
  $ diff -u output.mlx actual.mlx
