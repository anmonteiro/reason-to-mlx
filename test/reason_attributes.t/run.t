  $ ../../main.exe input.re -o actual.mlx
  $ grep -E 'explicit_arity|implicit_arity' actual.mlx
  [1]
  $ grep -oE '@keep\.[a-z]+' actual.mlx | sort
  @keep.expression
  @keep.pattern
  @keep.type
  $ mlx-pp -print-ml actual.mlx > /dev/null
