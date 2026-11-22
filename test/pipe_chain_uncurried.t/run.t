An uncurried stage (`f(. arg)`) keeps its own application boundary instead
of merging into the pipe: flattening it would move `filters.aggregation`
out of the attributed application that marks it uncurried. The adjacent
curried stage still flattens.

  $ ../../main.exe input.re -o actual.mlx
  $ diff -u output.mlx actual.mlx
