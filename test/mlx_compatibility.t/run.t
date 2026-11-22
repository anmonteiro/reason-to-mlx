Regression coverage for mlx issues 34 and 35.

  $ ../../main.exe input.re -o actual.mlx
  $ mlx-pp -print-ml actual.mlx
  module type T  = sig type t end
  module type Fresh  = (X : T) -> sig type t end
  let render children = ((Component.createElement () ~children)[@JSX ])
