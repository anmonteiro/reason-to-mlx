A blank line between a file's header comment and its first item stays.

  $ ../../main.exe block.re -o block.actual.mlx
  $ diff -u block.mlx block.actual.mlx

  $ ../../main.exe line.re -o line.actual.mlx
  $ diff -u line.mlx line.actual.mlx

A doc comment followed by a blank line prints as a floating doc comment, as in
the source: it does not document the first item.

  $ ../../main.exe doc.re -o doc.actual.mlx
  $ diff -u doc.mlx doc.actual.mlx

  $ ../../main.exe doc_then_comment.re -o doc_then_comment.actual.mlx
  $ diff -u doc_then_comment.mlx doc_then_comment.actual.mlx
