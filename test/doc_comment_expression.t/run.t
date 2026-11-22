A doc comment before a bare expression has no documentable OCaml position:
`preserve_documentation_comments` used to skip expressions entirely, so the
comment leaked into the output as a literal `[@ocaml.doc]`/`[@@@ocaml.text]`
attribute instead of staying a comment. It now prints as a plain, repositioned
`(* ... *)` comment, same as `expression_doc_comment.t`'s top-level case.

A doc comment leading the sole statement of a function body.

  $ ../../main.exe body_first_statement.re -o body_first_statement.actual.mlx
  $ diff -u body_first_statement.mlx body_first_statement.actual.mlx

The same, with a non-ASCII character in the comment text: it stays literal
UTF-8, not a decimal escape.

  $ ../../main.exe body_first_statement_unicode.re -o body_first_statement_unicode.actual.mlx
  $ diff -u body_first_statement_unicode.mlx body_first_statement_unicode.actual.mlx

A doc comment before the second statement of a `;`-separated sequence.

  $ ../../main.exe sequence_item.re -o sequence_item.actual.mlx
  $ diff -u sequence_item.mlx sequence_item.actual.mlx

  $ ../../main.exe sequence_item_unicode.re -o sequence_item_unicode.actual.mlx
  $ diff -u sequence_item_unicode.mlx sequence_item_unicode.actual.mlx

A doc comment before a `switch` arm's body leads that body, not the arm's
pattern or a sub-expression of the body.

  $ ../../main.exe switch_arm_body.re -o switch_arm_body.actual.mlx
  $ diff -u switch_arm_body.mlx switch_arm_body.actual.mlx

  $ ../../main.exe switch_arm_body_unicode.re -o switch_arm_body_unicode.actual.mlx
  $ diff -u switch_arm_body_unicode.mlx switch_arm_body_unicode.actual.mlx

A floating doc comment at file scope, written as its own `;`-terminated
statement with nothing to document: Reason attaches it as `[@@@ocaml.text]`
rather than `[@ocaml.doc]`, a name `preserve_documentation_comments` did not
match either, so the converter used to crash restoring it.

  $ ../../main.exe floating_file_scope.re -o floating_file_scope.actual.mlx
  $ diff -u floating_file_scope.mlx floating_file_scope.actual.mlx

  $ ../../main.exe floating_file_scope_unicode.re -o floating_file_scope_unicode.actual.mlx
  $ diff -u floating_file_scope_unicode.mlx floating_file_scope_unicode.actual.mlx

A doc comment on a local `let`, nested inside a function body: OCaml does
accept a leading doc comment on a `let` at any depth, so this one keeps
documenting its own binding instead of a bare expression's downgrade, but it
has no enclosing structure item to float a prepended copy before. It leads
its own `let` in place, not the top of the enclosing module or file.

  $ ../../main.exe local_let.re -o local_let.actual.mlx
  $ diff -u local_let.mlx local_let.actual.mlx

  $ ../../main.exe local_let_unicode.re -o local_let_unicode.actual.mlx
  $ diff -u local_let_unicode.mlx local_let_unicode.actual.mlx

The same, nested two levels deep (a local `let` inside another function
nested inside the first).

  $ ../../main.exe local_let_nested.re -o local_let_nested.actual.mlx
  $ diff -u local_let_nested.mlx local_let_nested.actual.mlx

  $ ../../main.exe local_let_nested_unicode.re -o local_let_nested_unicode.actual.mlx
  $ diff -u local_let_nested_unicode.mlx local_let_nested_unicode.actual.mlx
