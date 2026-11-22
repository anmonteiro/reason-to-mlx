A Reason `_` placeholder pipe, `x->f(a, _)`, prints as the call `f a x`, not
as `x |. fun __x -> f a __x`. The converter keeps the lambda when both the
piped value and another argument are calls, because the call form would
change which of them runs first.

  $ ../../main.exe input.re -o actual.mlx
  $ diff -u output.mlx actual.mlx
