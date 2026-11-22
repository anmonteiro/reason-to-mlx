A multi-stage pipe chain flattens even when a stage carries labelled and
optional arguments: `|.` splices the piped value in as the first argument
regardless of what else follows, so the labels keep their names and stay in
place.

  $ ../../main.exe input.re -o actual.mlx
  $ diff -u output.mlx actual.mlx
