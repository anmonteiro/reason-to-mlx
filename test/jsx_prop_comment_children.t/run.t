The expected output matches ocamlformat-mlx 0.29.0.2. ocamlformat-mlx PR #30
(https://github.com/ocaml-mlx/ocamlformat-mlx/pull/30), merged after that
release, breaks long JSX prop values onto their own line. Update the expected
output here when an ocamlformat-mlx release includes it.

  $ ../../main.exe own_line.re -o own_line.actual.mlx
  $ diff -u own_line.mlx own_line.actual.mlx

  $ ../../main.exe several.re -o several.actual.mlx
  $ diff -u several.mlx several.actual.mlx

  $ ../../main.exe same_line.re -o same_line.actual.mlx
  $ diff -u same_line.mlx same_line.actual.mlx
