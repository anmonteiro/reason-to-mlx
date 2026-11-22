A comment sitting in or next to a gap must not make the converter double a
blank line, lose one, or drop the comment.

A line comment, a block comment, and a doc comment each keep the source
blank before them and add none after, matching the source.

  $ ../../main.exe line_after_blank.re -o line_after_blank.actual.mlx
  $ diff -u line_after_blank.mlx line_after_blank.actual.mlx

  $ ../../main.exe block_after_blank.re -o block_after_blank.actual.mlx
  $ diff -u block_after_blank.mlx block_after_blank.actual.mlx

  $ ../../main.exe doc_after_blank.re -o doc_after_blank.actual.mlx
  $ diff -u doc_after_blank.mlx doc_after_blank.actual.mlx

A blank on both sides of the comment keeps both.

  $ ../../main.exe between_two_blanks.re -o between_two_blanks.actual.mlx
  $ diff -u between_two_blanks.mlx between_two_blanks.actual.mlx

The blank can sit only after the comment: none before it, one after.

  $ ../../main.exe end_of_gap.re -o end_of_gap.actual.mlx
  $ diff -u end_of_gap.mlx end_of_gap.actual.mlx

A comment trailing `a` on the same source line, then a blank, then `b`:
the comment stays on `a`'s line, and the blank after it is still recovered.

  $ ../../main.exe trailing.re -o trailing.actual.mlx
  $ diff -u trailing.mlx trailing.actual.mlx

No blank on either side stays that way.

  $ ../../main.exe no_blank.re -o no_blank.actual.mlx
  $ diff -u no_blank.mlx no_blank.actual.mlx

Several blank lines on both sides of a comment each collapse to one.

  $ ../../main.exe several_blanks_with_comment.re -o several_blanks_with_comment.actual.mlx
  $ diff -u several_blanks_with_comment.mlx several_blanks_with_comment.actual.mlx

Several blank lines with no comment at all collapse to one, same as any
other same-kind pair (see basic.t's own).

  $ ../../main.exe several_blanks_collapse.re -o several_blanks_collapse.actual.mlx
  $ diff -u several_blanks_collapse.mlx several_blanks_collapse.actual.mlx

A gap can hold more than one comment. Each gap in the run -- before the
first comment, between each pair, and after the last -- is checked on its
own, not just the two ends of the whole run.

  $ ../../main.exe two_comments_blank_between.re -o two_comments_blank_between.actual.mlx
  $ diff -u two_comments_blank_between.mlx two_comments_blank_between.actual.mlx

  $ ../../main.exe three_comments_blanks_between.re -o three_comments_blanks_between.actual.mlx
  $ diff -u three_comments_blanks_between.mlx three_comments_blanks_between.actual.mlx

  $ ../../main.exe blank_before_between_after.re -o blank_before_between_after.actual.mlx
  $ diff -u blank_before_between_after.mlx blank_before_between_after.actual.mlx

No blank between or after any of three comments in one gap stays that way.

  $ ../../main.exe no_blank_multi_comment.re -o no_blank_multi_comment.actual.mlx
  $ diff -u no_blank_multi_comment.mlx no_blank_multi_comment.actual.mlx

A line comment, a block comment, and a doc comment in the same run each
keep their own neighboring blank.

  $ ../../main.exe mixed_kinds_blank_between.re -o mixed_kinds_blank_between.actual.mlx
  $ diff -u mixed_kinds_blank_between.mlx mixed_kinds_blank_between.actual.mlx

The same gap, inside a nested module.

  $ ../../main.exe nested_module_blank_between.re -o nested_module_blank_between.actual.mlx
  $ diff -u nested_module_blank_between.mlx nested_module_blank_between.actual.mlx

The same shapes inside a let-chain. A comment can sit on either side of
the chain's own recovered blank, but never both: the marker wraps the
comment's target node as a whole (see mark_blank_expr_lines), so when the
source blank was genuinely after the comment, the single recovered blank
still prints before it, not doubled and never dropped.

  $ ../../main.exe letchain_before_blank.re -o letchain_before_blank.actual.mlx
  $ diff -u letchain_before_blank.mlx letchain_before_blank.actual.mlx

  $ ../../main.exe letchain_after_blank.re -o letchain_after_blank.actual.mlx
  $ diff -u letchain_after_blank.mlx letchain_after_blank.actual.mlx

  $ ../../main.exe letchain_no_blank.re -o letchain_no_blank.actual.mlx
  $ diff -u letchain_no_blank.mlx letchain_no_blank.actual.mlx

Several blank lines with no comment at all, inside a let-chain, also
collapse to one.

  $ ../../main.exe letchain_several_blanks_collapse.re -o letchain_several_blanks_collapse.actual.mlx
  $ diff -u letchain_several_blanks_collapse.mlx letchain_several_blanks_collapse.actual.mlx
