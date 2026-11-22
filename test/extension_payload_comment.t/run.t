A comment right after the extension name stays inside the brackets, before the
payload, as it was in the Reason source. In a match arm it never leaves the arm.

  $ ../../main.exe input.re -o actual.mlx
  $ diff -u output.mlx actual.mlx
