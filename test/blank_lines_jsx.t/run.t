A component whose body is a let-chain ending in a JSX return, and JSX
children long enough to force one per line. The let-chain's blank (`title`
to `subtitle`) is an ordinary expression-level gap and is kept, the same as
any other let-chain ending in a non-JSX expression. The source blank
between the first two children collapses: ocamlformat-mlx does not track
locations for JSX children at all (see the research report), so nothing
the converter feeds it can change that, unlike a switch case (also always
collapsed, but because ocamlformat-mlx does track locations there and
chooses to collapse anyway).

  $ ../../main.exe input.re -o actual.mlx
  $ diff -u output.mlx actual.mlx
