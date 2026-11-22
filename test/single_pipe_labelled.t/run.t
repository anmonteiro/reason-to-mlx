A single `->` stage whose call carries a labelled argument stays a pipe,
`x |. f ~label:v rest`, not the nested application `(f x) ~label:v rest`.

A labelled argument together with another positional argument.

  $ ../../main.exe labelled_and_positional.re -o labelled_and_positional.actual.mlx
  $ diff -u labelled_and_positional.mlx labelled_and_positional.actual.mlx

A labelled argument alone.

  $ ../../main.exe labelled_only.re -o labelled_only.actual.mlx
  $ diff -u labelled_only.mlx labelled_only.actual.mlx

A punned optional argument.

  $ ../../main.exe optional_arg.re -o optional_arg.actual.mlx
  $ diff -u optional_arg.mlx optional_arg.actual.mlx

An uncurried stage (`f(. arg)`) stays nested: flattening it into `|.` would
change which arguments the `[@u]` attribute applies to.

  $ ../../main.exe uncurried_stage.re -o uncurried_stage.actual.mlx
  $ diff -u uncurried_stage.mlx uncurried_stage.actual.mlx

A callee that is not a plain function name, here a lambda, stays nested too.

  $ ../../main.exe lambda_callee.re -o lambda_callee.actual.mlx
  $ diff -u lambda_callee.mlx lambda_callee.actual.mlx

A labelled stage inside a longer chain keeps every stage on `|.`, as before.

  $ ../../main.exe chain.re -o chain.actual.mlx
  $ diff -u chain.mlx chain.actual.mlx
