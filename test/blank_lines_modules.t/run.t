Modules, nested modules, a module type, a functor, and an anonymous
`include struct` body, each with a blank line present between some
siblings and absent between others. Two comments add the same before/after
check inside this structure: one between two bindings of a nested module,
one just after the anonymous `include struct` block.

  $ ../../main.exe input.re -o actual.mlx
  $ diff -u output.mlx actual.mlx
