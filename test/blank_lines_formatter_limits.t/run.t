Source blank lines that ocamlformat-mlx removes from the converter's output
text. Each one is dropped when the formatter reads an `.mlx` file with the
blank line in place, so the converter cannot keep them: after `open` and
after a local `module` in a let-chain, between match cases, and between
record fields in an expression or a type. If the formatter learns to keep
one, the expectation here changes.

  $ ../../main.exe input.re -o actual.mlx
  $ diff -u output.mlx actual.mlx
