GADT type definitions and functions that match on them with a locally
abstract type (`type a. selector(a) => ...`), which needs its own path
through the comment machinery (see has_locally_abstract_constraint) so a
leading comment does not corrupt the type-binder syntax; this exercises
that same path for a blank line.

`selector`'s two constructors keep their source blank; that grouping is
ocamlformat-mlx's own, not this feature (a GADT constructor list is not a
structure item, a let-chain, or a `;` sequence, so mark_blank_expr_lines
and mark_blank_item_lines never touch it).

`describeTwo` repeats `classify`'s let-chain gap on a locally abstract
binding, with a comment that in the source has no blank before it and one
after; the output matches letchain_after_blank.re in
blank_lines_comments.t exactly: the recovered blank still prints before
the comment, not after, per that file's account of what an expression
marker can and cannot do.

  $ ../../main.exe input.re -o actual.mlx
  $ diff -u output.mlx actual.mlx
