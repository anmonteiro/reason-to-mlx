An attribute on a pipe callee (`->([@attr] f)(...)`) must print exactly
once, on the callee, even when flattening the pipe exposes a synthesized
application node around it. The duplicate used to come from reusing the
callee's own record (`{callee with ...}`) to build that wrapper node, which
copied the callee's attributes onto the wrapper too.

A chain of two or more pipes, where the attributed callee takes a further
explicit argument beyond the piped value.

  $ ../../main.exe chain.re -o chain.actual.mlx
  $ diff -u chain.mlx chain.actual.mlx

A single pipe whose attributed callee has a labelled argument and a further
explicit argument.

  $ ../../main.exe single_labelled.re -o single_labelled.actual.mlx
  $ diff -u single_labelled.mlx single_labelled.actual.mlx

Guard: a single pipe whose attributed callee takes no further argument
beyond the piped value never rewrites into the wrapper shape, so the
attribute was never duplicated here; this must stay unchanged.

  $ ../../main.exe single_no_extra_arg.re -o single_no_extra_arg.actual.mlx
  $ diff -u single_no_extra_arg.mlx single_no_extra_arg.actual.mlx
