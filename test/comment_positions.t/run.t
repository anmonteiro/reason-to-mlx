The expected output matches ocamlformat-mlx 0.29.0.2. ocamlformat-mlx PR #30
(https://github.com/ocaml-mlx/ocamlformat-mlx/pull/30), merged after that
release, breaks long JSX prop values onto their own line. Update the expected
output here when an ocamlformat-mlx release includes it.

The converter used to move comments in these shapes. Each case below is
a minimal input for one of them, and the converter now keeps the comment
where the Reason source has it.

A comment leading a function body that has no `let` leads the body, not
the last parameter's default value.

  $ ../../main.exe block_first_statement.re -o block_first_statement.actual.mlx
  $ diff -u block_first_statement.mlx block_first_statement.actual.mlx

A comment leading the first `let` of an `if` body leads that `let`, not
the `if` condition. The same rule covers `while`, `for` and function
bodies.

  $ ../../main.exe block_first_let.re -o block_first_let.actual.mlx
  $ diff -u block_first_let.mlx block_first_let.actual.mlx

A comment before a match's first arm stays after `with`, not inside the
scrutinee.

  $ ../../main.exe match_scrutinee_gap.re -o match_scrutinee_gap.actual.mlx
  $ diff -u match_scrutinee_gap.mlx match_scrutinee_gap.actual.mlx

A comment between two JSX props stays between them when the earlier
prop's value is a function application (`size->getViewBox` becomes
`getViewBox size`); it does not split the application.

  $ ../../main.exe jsx_prop_gap_call_value.re -o jsx_prop_gap_call_value.actual.mlx
  $ diff -u jsx_prop_gap_call_value.mlx jsx_prop_gap_call_value.actual.mlx

Two JSX attribute gaps next to a multi-line call-valued attribute: each
comment stays before the attribute it was written before, and none escape
into the children. The indent under `styles=`/`style=` comes from
ocamlformat-mlx: it gives an own-line comment between two JSX props
continuation indent even when its input has none.

  $ ../../main.exe jsx_attr_call_neighbor.re -o jsx_attr_call_neighbor.actual.mlx
  $ diff -u jsx_attr_call_neighbor.mlx jsx_attr_call_neighbor.actual.mlx

A doc comment on a `let%extension` binding (here `melange_only`) becomes a
leading `[@ocaml.doc]` on the binding, not a trailing `[@@ocaml.doc]` after
its body. A plain local `let` keeps today's form: ocamlformat accepts the
leading attribute only after an extension name.

  $ ../../main.exe local_let_doc_comment.re -o local_let_doc_comment.actual.mlx
  $ diff -u local_let_doc_comment.mlx local_let_doc_comment.actual.mlx

A same-line trailing comment on a record field inside a list stays on
that field.

  $ ../../main.exe list_record_field_trailing.re -o list_record_field_trailing.actual.mlx
  $ diff -u list_record_field_trailing.mlx list_record_field_trailing.actual.mlx

A same-line trailing comment on a structure-item `let` stays on that
line, with no blank line added and nothing moved to the next item.

  $ ../../main.exe structure_let_trailing_comment.re -o structure_let_trailing_comment.actual.mlx
  $ diff -u structure_let_trailing_comment.mlx structure_let_trailing_comment.actual.mlx

A comment between two `;`-separated statements leads the next statement.

  $ ../../main.exe sequence_statement_gap.re -o sequence_statement_gap.actual.mlx
  $ diff -u sequence_statement_gap.mlx sequence_statement_gap.actual.mlx

A same-line trailing comment after a JSX attribute stays on that line when
the next attribute's value is a lambda.

  $ ../../main.exe jsx_attr_trailing_before_lambda.re -o jsx_attr_trailing_before_lambda.actual.mlx
  $ diff -u jsx_attr_trailing_before_lambda.mlx jsx_attr_trailing_before_lambda.actual.mlx

Regression guard: an own-line comment between an element JSX child and a
following expression-call JSX child leads the expression child.
jsx_boundaries.re and jsx_fragment_last_child.re in comments.t cover only
element children.

  $ ../../main.exe jsx_element_then_expr_child.re -o jsx_element_then_expr_child.actual.mlx
  $ diff -u jsx_element_then_expr_child.mlx jsx_element_then_expr_child.actual.mlx
