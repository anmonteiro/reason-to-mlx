Top-level lets, types, externals, and opens each appear twice: once with a
source blank line before the next one, once without. `open Deque` and
`open Queue` add a comment to the gap, one with no blank before it and
none after, one with no blank before it and one after.

  $ ../../main.exe input.re -o actual.mlx
  $ diff -u output.mlx actual.mlx
