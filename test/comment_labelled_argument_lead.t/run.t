The expected output matches ocamlformat-mlx 0.29.0.2. ocamlformat-mlx PR #30
(https://github.com/ocaml-mlx/ocamlformat-mlx/pull/30), merged after that
release, breaks long JSX prop values onto their own line. Update the expected
output here when an ocamlformat-mlx release includes it.

  $ ../../main.exe input.re -o actual.mlx
  $ diff -u output.mlx actual.mlx
