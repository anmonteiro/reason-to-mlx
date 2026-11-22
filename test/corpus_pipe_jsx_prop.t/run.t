The expected output matches ocamlformat-mlx 0.29.0.2. ocamlformat-mlx PR #30
(https://github.com/ocaml-mlx/ocamlformat-mlx/pull/30), merged after that
release, breaks long JSX prop values onto their own line. Update the expected
output here when an ocamlformat-mlx release includes it.

A two-stage pipe chain used directly as a JSX optional prop value, ending
in a call whose argument is a `_`-pattern lambda. The chain must flatten
the same way inside a JSX attribute as anywhere else.

  $ ../../main.exe input.re -o actual.mlx
  $ diff -u output.mlx actual.mlx
