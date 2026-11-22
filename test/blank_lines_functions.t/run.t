Blank lines inside function bodies: a let-chain, a `;` sequence, a
let-chain with labelled and optional arguments, and a let-chain inside an
anonymous function passed as an argument with a multi-statement body.

`isEven`/`isOdd` is a `let rec ... and ...` pair with no source blank
between the two bindings; and-bindings are not one of the constructs this
feature targets (they are neither a structure/signature item list nor a
let-chain link). The blank ocamlformat-mlx prints between them here is
its own convention under `module-item-spacing=preserve`, present
regardless of source; it is unrelated to this feature and was already
there before this change.

  $ ../../main.exe input.re -o actual.mlx
  $ diff -u output.mlx actual.mlx
