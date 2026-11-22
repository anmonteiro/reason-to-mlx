The `JSONObject` stage passes a labelled argument whose *value* is an
uncurried lambda (`(. value) => ...`), but the outer application itself
carries no attribute, so it still flattens. This is different from an
uncurried *stage* (`f(. arg)`), which must stay nested.

  $ ../../main.exe input.re -o actual.mlx
  $ diff -u output.mlx actual.mlx
