A component tag whose only content is a comment (no props, no real children)
used to crash: "MLX rendering left comments unprinted". ocamlformat-mlx's
JSX printer looks for this comment on the callee's own node
(jsx_helper.ml's [tag_loc] for a module-path callee is [e0.pexp_loc]), but
the comment is attached to the identifier's inner location instead. A DOM
tag (dom_control.re below) does not need the sweep: for a plain identifier
callee, [tag_loc] already is that inner location.

  $ ../../main.exe only_comment.re -o only_comment.actual.mlx
  $ diff -u only_comment.mlx only_comment.actual.mlx

Two stacked comments in the same position.

  $ ../../main.exe two_comments.re -o two_comments.actual.mlx
  $ diff -u two_comments.mlx two_comments.actual.mlx

A component with a comment-only child nested inside a DOM element.

  $ ../../main.exe nested.re -o nested.actual.mlx
  $ diff -u nested.mlx nested.actual.mlx

A comment-only fragment prints as `<></>` followed by the comment.

  $ ../../main.exe fragment_only_comment.re -o fragment_only_comment.actual.mlx
  $ diff -u fragment_only_comment.mlx fragment_only_comment.actual.mlx

A component with a real prop and a comment-only child already worked before
this fix, because the prop gave the comment a place to print.

  $ ../../main.exe prop_and_comment.re -o prop_and_comment.actual.mlx
  $ diff -u prop_and_comment.mlx prop_and_comment.actual.mlx

Control: a DOM tag with a comment-only child and no props, unaffected by
this change.

  $ ../../main.exe dom_control.re -o dom_control.actual.mlx
  $ diff -u dom_control.mlx dom_control.actual.mlx
