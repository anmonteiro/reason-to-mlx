A leading comment of the first JSX child or the first JSX prop used to move to
the end of its element: after the last child for `<Row> // c <A /> </Row>`,
after the last prop for `<Foo // c a=1 b=2 />`. It stays before that child or
prop now. Comments before later children and props were never moved.

The first child of a DOM tag.

  $ ../../main.exe first_child.re -o first_child.actual.mlx
  $ diff -u first_child.mlx first_child.actual.mlx

The first and second child of a component each keep their comment.

  $ ../../main.exe first_child_component.re -o first_child_component.actual.mlx
  $ diff -u first_child_component.mlx first_child_component.actual.mlx

The first child of a fragment.

  $ ../../main.exe fragment_first_child.re -o fragment_first_child.actual.mlx
  $ diff -u fragment_first_child.mlx fragment_first_child.actual.mlx

A comment before the first child when the element has props.

  $ ../../main.exe child_with_props.re -o child_with_props.actual.mlx
  $ diff -u child_with_props.mlx child_with_props.actual.mlx

The first prop of a DOM tag. This already worked.

  $ ../../main.exe first_prop_dom.re -o first_prop_dom.actual.mlx
  $ diff -u first_prop_dom.mlx first_prop_dom.actual.mlx

The first prop of a component, a module-path component with children, and a
component with a comment before both its first prop and its first child.

  $ ../../main.exe first_prop_component.re -o first_prop_component.actual.mlx
  $ diff -u first_prop_component.mlx first_prop_component.actual.mlx

  $ ../../main.exe first_prop_module_path.re -o first_prop_module_path.actual.mlx
  $ diff -u first_prop_module_path.mlx first_prop_module_path.actual.mlx

  $ ../../main.exe prop_and_child.re -o prop_and_child.actual.mlx
  $ diff -u prop_and_child.mlx prop_and_child.actual.mlx

A JSX-valued first prop keeps the comment on the tag, before the prop.

  $ ../../main.exe first_prop_jsx_value.re -o first_prop_jsx_value.actual.mlx
  $ diff -u first_prop_jsx_value.mlx first_prop_jsx_value.actual.mlx

A punned first prop prints in the explicit `label=label` form, which is the
only form ocamlformat-mlx keeps stable when the prop has a comment. The comment
stays next to the prop.

  $ ../../main.exe first_prop_punned.re -o first_prop_punned.actual.mlx
  $ diff -u first_prop_punned.mlx first_prop_punned.actual.mlx

A comment on the same line as the tag stays right after the tag.

  $ ../../main.exe same_line_after_tag.re -o same_line_after_tag.actual.mlx
  $ diff -u same_line_after_tag.mlx same_line_after_tag.actual.mlx
