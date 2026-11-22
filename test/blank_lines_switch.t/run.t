A switch case list is not a structure item, a let-chain, or a `;` sequence,
so neither marker touches it: the source blank between `1` and `2` always
collapses, matching ocamlformat-mlx's own unconditional behavior for match
cases (see the research report). A let-chain inside a case body is an
ordinary expression-level gap, so case `3`'s blank between `label` and
`suffix` is kept, the same as any other let-chain.

  $ ../../main.exe input.re -o actual.mlx
  $ diff -u output.mlx actual.mlx
