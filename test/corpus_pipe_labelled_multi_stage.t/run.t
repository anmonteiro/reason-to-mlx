A five-stage chain where one stage carries two labelled arguments
(`~key:`, `~compare:`), one of which itself is a lambda whose body is a
second, independent pipe chain; the chain ends with a comparator lambda
containing its own `let` bindings. Every stage should flatten except where
an inner pipe chain has its own boundary.

  $ ../../main.exe input.re -o actual.mlx
  $ diff -u output.mlx actual.mlx
