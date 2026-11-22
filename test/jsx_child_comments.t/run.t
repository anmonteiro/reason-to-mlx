A comment on its own line before a JSX child stays between that child and the
previous one, also when the previous child is a `match`, a ternary or an
extension point. It used to land inside the previous child.

  $ ../../main.exe after_match_child.re -o after_match_child.actual.mlx
  $ diff -u after_match_child.mlx after_match_child.actual.mlx

  $ ../../main.exe after_intl_child.re -o after_intl_child.actual.mlx
  $ diff -u after_intl_child.mlx after_intl_child.actual.mlx

  $ ../../main.exe after_ternary_child_fragment.re -o after_ternary_child_fragment.actual.mlx
  $ diff -u after_ternary_child_fragment.mlx after_ternary_child_fragment.actual.mlx
