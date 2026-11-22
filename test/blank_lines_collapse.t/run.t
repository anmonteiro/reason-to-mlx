Record fields (a type declaration and a literal), list items, and array
items all keep the source blank between the first two elements out of
scope: none of these is a structure/signature item, a let-chain, or a `;`
sequence. Long field and element names force each one onto its own line,
so a kept blank would be visible if ocamlformat-mlx tracked one; it does
not, for any of the four, regardless of what the converter feeds it (see
the research report).

  $ ../../main.exe input.re -o actual.mlx
  $ diff -u output.mlx actual.mlx
