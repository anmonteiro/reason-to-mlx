A comment on its own line next to a punned prop or a JSX-valued prop stays
between the same two props. It used to jump to the end of the tag, or after
the whole element.

A comment after a punned prop.

  $ ../../main.exe after_punned_prop.re -o after_punned_prop.actual.mlx
  $ diff -u after_punned_prop.mlx after_punned_prop.actual.mlx

A comment before the last prop, which is punned.

  $ ../../main.exe before_last_punned_prop.re -o before_last_punned_prop.actual.mlx
  $ diff -u before_last_punned_prop.mlx before_last_punned_prop.actual.mlx

A comment after the last prop, which is punned.

  $ ../../main.exe after_last_punned_prop.re -o after_last_punned_prop.actual.mlx
  $ diff -u after_last_punned_prop.mlx after_last_punned_prop.actual.mlx

A comment right after the opening brace of a JSX-valued prop stays in that prop.

  $ ../../main.exe brace_start.re -o brace_start.actual.mlx
  $ diff -u brace_start.mlx brace_start.actual.mlx

A comment on the same line after a JSX-valued prop stays with that prop.

  $ ../../main.exe trailing_after_jsx_prop.re -o trailing_after_jsx_prop.actual.mlx
  $ diff -u trailing_after_jsx_prop.mlx trailing_after_jsx_prop.actual.mlx

The same with children.

  $ ../../main.exe children_with_punned_prop.re -o children_with_punned_prop.actual.mlx
  $ diff -u children_with_punned_prop.mlx children_with_punned_prop.actual.mlx
