The OCaml lexer turns CRLF inside a string into LF. A plain string keeps its
CR and LF as escapes. A quoted string has no escapes, so it is refused.

  $ printf 'let a = "x\r\ny";\r\nlet b = [%%raw "p\r\nq"];\r\n' > plain.re
  $ ../../main.exe plain.re
  let a = "x\r\ny"
  let b = [%raw "p\r\nq"]

  $ printf 'let a = 1;\r\nlet b = {|x\r\ny|};\r\n' > quoted.re
  $ ../../main.exe quoted.re
  reason-to-mlx: quoted.re:2: quoted string holds a CRLF line break, which the
                 OCaml lexer reads as LF
  [124]

  $ printf 'let a = 1;\nlet b = {js|x\r\ny|js};\n' > quoted_js.re
  $ ../../main.exe quoted_js.re
  reason-to-mlx: quoted_js.re:2: quoted string holds a CRLF line break, which
                 the OCaml lexer reads as LF
  [124]

  $ printf 'let a = {|x\ny|};\r\n' > lf_only.re
  $ ../../main.exe lf_only.re
  let a = {|x
  y|}
