Operators that mlx 0.12 lexes as two tokens are refused. Others convert.

  $ ../../main.exe ok.re
  let ( <>- ) a b = a
  let ( <>= ) a b = a
  let ( >>= ) a b = a
  let c x y = x <>- y

  $ ../../main.exe tag.re
  reason-to-mlx: tag.re:3: operator `<><` is split by the mlx 0.12 lexer
  [124]

  $ ../../main.exe close.re
  reason-to-mlx: close.re:3: operator `</><` is split by the mlx 0.12 lexer
  [124]

  $ ../../main.exe infix.re
  reason-to-mlx: infix.re:3: operator `<><=` is split by the mlx 0.12 lexer
  [124]

  $ ../../main.exe sig.rei
  reason-to-mlx: sig.rei:1: operator `<><` is split by the mlx 0.12 lexer
  [124]
