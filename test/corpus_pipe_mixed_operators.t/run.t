A chain mixing `->` and `|>` stages: only the `->` stages parse as `|.`
applications, so flattening must stop at each `|>` boundary instead of
merging across it.

  $ ../../main.exe input.re -o actual.mlx
  $ diff -u output.mlx actual.mlx
