Reason parses `let f = (x: int): t => body` as `let f x = (body : t)`. The
converter prints a Reason return type in the function header. It is a body
constraint whose type starts in the source before the body.

  $ ../../main.exe plain.re -o plain.actual.mlx
  $ diff -u plain.mlx plain.actual.mlx

A labelled argument does not change where the return type goes.

  $ ../../main.exe labelled.re -o labelled.actual.mlx
  $ diff -u labelled.mlx labelled.actual.mlx

Both bindings of a `let rec ... and` get the same treatment, independently.

  $ ../../main.exe rec_and.re -o rec_and.actual.mlx
  $ diff -u rec_and.mlx rec_and.actual.mlx

A block body keeps the type on the header, not after the closing brace.

  $ ../../main.exe block_body.re -o block_body.actual.mlx
  $ diff -u block_body.mlx block_body.actual.mlx

A `switch` (`match`) body keeps the type on the header too.

  $ ../../main.exe switch_body.re -o switch_body.actual.mlx
  $ diff -u switch_body.mlx switch_body.actual.mlx

A constraint the author wrote themselves, `x => (x: int)`, has its type
start after the body it wraps, so it is left alone.

  $ ../../main.exe author_constraint.re -o author_constraint.actual.mlx
  $ diff -u author_constraint.mlx author_constraint.actual.mlx

A local `let` inside another expression gets the same treatment as a
top-level one.

  $ ../../main.exe local_let.re -o local_let.actual.mlx
  $ diff -u local_let.mlx local_let.actual.mlx

A comment between the parameters and the return type is kept. It trails the
parameter's type.

  $ ../../main.exe comment_near_type.re -o comment_near_type.actual.mlx
  $ diff -u comment_near_type.mlx comment_near_type.actual.mlx

A `melange_only` binding keeps its parameters curried. The return type goes
on the innermost function.

  $ ../../main.exe melange_only.re -o melange_only.actual.mlx
  $ diff -u melange_only.mlx melange_only.actual.mlx

A `let` with a locally abstract type (`type a.`) keeps it, and its return
type also goes in the header.

  $ ../../main.exe locally_abstract_type.re -o locally_abstract_type.actual.mlx
  $ diff -u locally_abstract_type.mlx locally_abstract_type.actual.mlx

A `[@react.component]` make function gets the same treatment.

  $ ../../main.exe react_component.re -o react_component.actual.mlx
  $ diff -u react_component.mlx react_component.actual.mlx

An uncurried (`[@u]`) function gets the same treatment.

  $ ../../main.exe uncurried.re -o uncurried.actual.mlx
  $ diff -u uncurried.mlx uncurried.actual.mlx
