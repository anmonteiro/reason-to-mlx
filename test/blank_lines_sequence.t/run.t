A blank line before the last statement of a `;` sequence stays, at the top
of a function body, after an `if` statement, and inside branches, case
bodies and loops. A blank line after a binding operator (`let.await`) stays.

  $ ../../main.exe input.re -o actual.mlx
  $ diff -u output.mlx actual.mlx
