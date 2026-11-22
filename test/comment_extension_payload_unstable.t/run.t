  $ ../../main.exe input.re -o actual.mlx 2>&1 | tr -s ' \n' ' ' | grep -o 'comment before a quoted string at line [0-9]*'
  comment before a quoted string at line 3
  $ test -e actual.mlx
  [1]
