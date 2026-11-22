A blank line in the source before a comment that leads a let-chain's final
body stays above the comment in the output. Before this fix,
mark_blank_expr_lines skipped preserving that blank line whenever the body
carried a leading comment, so the blank line was dropped outright instead
(see comments.t's let_body_jsx_multiline.re for the original report).

A single-line comment:

  $ ../../main.exe single_line.re -o single_line.actual.mlx
  $ diff -u single_line.mlx single_line.actual.mlx

No blank line in the source: none appears in the output.

  $ ../../main.exe no_blank_line.re -o no_blank_line.actual.mlx
  $ diff -u no_blank_line.mlx no_blank_line.actual.mlx

A non-JSX body: the fix is not specific to JSX.

  $ ../../main.exe non_jsx_body.re -o non_jsx_body.actual.mlx
  $ diff -u non_jsx_body.mlx non_jsx_body.actual.mlx

More than one `let` before the comment: each binding's own gap is checked
independently, so the blank line survives regardless of chain depth.

  $ ../../main.exe nested_let_chain.re -o nested_let_chain.actual.mlx
  $ diff -u nested_let_chain.mlx nested_let_chain.actual.mlx

A blank line in the source between the comment and the body, not before the
comment: mark_blank_expr_lines's blank-gap check spans from the last
binding to the body, comment included, so it cannot tell which side of the
comment the blank line was on. The output moves the blank line above the
comment instead of keeping it below. That is not a faithful round-trip of
this particular source, but the fix's one invariant still holds: no blank
line ever lands between the comment and the body it leads.

  $ ../../main.exe blank_after_comment.re -o blank_after_comment.actual.mlx
  $ diff -u blank_after_comment.mlx blank_after_comment.actual.mlx

A comment that leads a later `let` of a chain gets no blank line above it
when the source had none.

  $ ../../main.exe let_comment_no_blank.re -o let_comment_no_blank.actual.mlx
  $ diff -u let_comment_no_blank.mlx let_comment_no_blank.actual.mlx
