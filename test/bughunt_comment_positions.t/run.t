Bug hunt fix D: three comment-position bugs found in the adversarial and
interfaces-attributes reports. Each case below is a minimal input for one
of the affected shapes; the converter now keeps the comment on the same
node the Reason source had it on.

List literals: a comment before the first element had no attachment point
(list elements were excluded from the generic comment-candidate pool, an
exclusion meant for JSX children) and fell through to whatever node sat
outside the list - the enclosing `let`, a call's callee, a JSX prop's tag,
or the whole `match`. It now leads the first element, inside the brackets,
the same way an existing leading comment on a later element already does.

An empty list, with nothing inside but the comment, stays in let-bound
position:

  $ ../../main.exe list_let_bound_empty.re -o list_let_bound_empty.actual.mlx
  $ diff -u list_let_bound_empty.mlx list_let_bound_empty.actual.mlx

As a call argument, the list's own brackets stay around the comment
instead of it trailing the callee:

  $ ../../main.exe list_call_argument.re -o list_call_argument.actual.mlx
  $ diff -u list_call_argument.mlx list_call_argument.actual.mlx

As a JSX prop value, the comment stays inside the prop's own list instead
of trailing the prop, next to the closing `/>`:

  $ ../../main.exe list_jsx_prop.re -o list_jsx_prop.actual.mlx
  $ diff -u list_jsx_prop.mlx list_jsx_prop.actual.mlx

As a match arm's body, the comment stays inside that arm's list instead of
escaping the whole `match` to document the function itself:

  $ ../../main.exe list_match_arm.re -o list_match_arm.actual.mlx
  $ diff -u list_match_arm.mlx list_match_arm.actual.mlx

The blank-line case: a previous sibling `let` exists, and the fallback
used to fabricate a blank line between it and the hoisted comment that was
never in the source. With the comment now attached inside the list, no
such line appears.

  $ ../../main.exe list_blank_line.re -o list_blank_line.actual.mlx
  $ diff -u list_blank_line.mlx list_blank_line.actual.mlx

Parameters: a same-line trailing comment on a parameter that is not the
last one became a leading comment on the next parameter instead, both in a
`.re` function definition and a `.rei` function type. It now stays
trailing the parameter it followed.

A `.re` definition, labelled parameters:

  $ ../../main.exe param_re_labelled.re -o param_re_labelled.actual.mlx
  $ diff -u param_re_labelled.mlx param_re_labelled.actual.mlx

A labelled parameter with its own type annotation and a default value: the
attribute used to land on the pattern, and a `Ppat_constraint` pattern's
own attributes print after the type rather than after the bare name,
splitting the parameter in two (`b : string -> string (* keep *) =
Fn.identity` instead of `b : string -> string = Fn.identity (* keep *)`,
Select.re's `searchQueryTransform` in the corpus). It now attaches to the
default value itself, which always prints right after itself regardless
of what the pattern looks like:

  $ ../../main.exe param_re_labelled_typed_default.re -o param_re_labelled_typed_default.actual.mlx
  $ diff -u param_re_labelled_typed_default.mlx param_re_labelled_typed_default.actual.mlx

A `.re` definition, positional parameters (long names force a line wrap,
which is where the misattachment was visible: the comment used to lead
the second parameter on its own line instead of trailing the first):

  $ ../../main.exe param_re_positional.re -o param_re_positional.actual.mlx
  $ diff -u param_re_positional.mlx param_re_positional.actual.mlx

A `.rei` function type, labelled parameters (the Dropdown.rei/Select.rei
shape from the corpus):

  $ ../../main.exe param_rei_labelled.rei -o param_rei_labelled.actual.mli
  $ diff -u param_rei_labelled.mli param_rei_labelled.actual.mli

A `.rei` function type, positional parameters:

  $ ../../main.exe param_rei_positional.rei -o param_rei_positional.actual.mli
  $ diff -u param_rei_positional.mli param_rei_positional.actual.mli

Type arguments: the same same-line trailing rule applies to a type, not
only a parameter. A positional constructor argument's type can have a
same-line comment after it too; it only leads the next argument's type
when something else actually follows on that line (a later-element
comment that ends its own line, like the parameter cases above, still
trails what it follows instead):

  $ ../../main.exe ctor_tuple_positional.re -o ctor_tuple_positional.actual.mlx
  $ diff -u ctor_tuple_positional.mlx ctor_tuple_positional.actual.mlx

A function's own return-type constraint must never receive a comment that
is actually inside the body: with nothing else nearby, the generic
comment-candidate search used to pick the return type anyway (nearest
previous, regardless of distance), printing the comment as if it
documented the type. The same rule covers both comment styles.

A `/* */` comment on the first line of the body:

  $ ../../main.exe return_type_body_block_comment.re -o return_type_body_block_comment.actual.mlx
  $ diff -u return_type_body_block_comment.mlx return_type_body_block_comment.actual.mlx

A `//` comment on the first line of the body:

  $ ../../main.exe return_type_body_line_comment.re -o return_type_body_line_comment.actual.mlx
  $ diff -u return_type_body_line_comment.mlx return_type_body_line_comment.actual.mlx

`[@react.component]`: moving the attribute from after `let` to
`let[@react.component]` left behind a comment that had sat right after it
in the source; the comment printed after the whole function body instead.
It now stays inside the attribute's own brackets, right after its name,
which is also where it ends up surviving the move (the mlx formatter
tracks a comment by source position relative to the nearest node, and an
attribute keeps its own location when an AST pass relocates it within the
same binding).

Plain `[@react.component]`:

  $ ../../main.exe react_component_plain.re -o react_component_plain.actual.mlx
  $ diff -u react_component_plain.mlx react_component_plain.actual.mlx

`[@react.client.component]`:

  $ ../../main.exe react_component_client.re -o react_component_client.actual.mlx
  $ diff -u react_component_client.mlx react_component_client.actual.mlx

`[@react.async.component]`:

  $ ../../main.exe react_component_async.re -o react_component_async.actual.mlx
  $ diff -u react_component_async.mlx react_component_async.actual.mlx

A reduced ReactModal.re shape: labelled, function-typed parameters
(`unit => unit`), some of them optional (`=?`), with both an own-line
comment between two parameters and a same-line trailing comment after a
function-typed one. At 9ecbd73c8fca the trailing comment after
`onAfterClose` split its function type into two curried parameters
(`?onAfterClose:unit -> unit (* ... *) -> ...`, dropping the parens a
function type needs as another arrow's domain), and the own-line comment
before `onRequestClose` landed on the same nested `unit`, with the same
dropped parens, instead of leading `onRequestClose`. The own-line comment
before the plain `isOpen:bool` already led `isOpen` correctly (an atomic
type never needs parens of its own, so the dropped-bracket bug never
touched it). The fix keeps every function type's own parens and leads the
comment to the whole of the next parameter, matching 5aace80951a2 (the
commit before the regression):

A `.re` external:

  $ ../../main.exe reactmodal_external.re -o reactmodal_external.actual.mlx
  $ diff -u reactmodal_external.mlx reactmodal_external.actual.mlx

A `.rei` val, the same shape:

  $ ../../main.exe reactmodal_external.rei -o reactmodal_external.actual.mli
  $ diff -u reactmodal_external.mli reactmodal_external.actual.mli

Both must type-check standalone, the same proof keyword_identifiers.t uses
for its `.re` and `.rei` fixtures: a dropped paren around a function type
would change `make`'s arity, which only shows up by actually compiling the
converted signature, not by comparing text.

  $ ../../main.exe reactmodal_external.re -o rt_out.mlx
  $ ocamlformat-mlx --enable-outside-detected-project rt_out.mlx > rt_fmt.mlx
  $ diff rt_out.mlx rt_fmt.mlx
  $ cp rt_out.mlx rt_check.ml
  $ ocamlfind ocamlc -c rt_check.ml 2>&1 | grep -v 'Cannot read directory' || true
  $ rm -f rt_out.mlx rt_fmt.mlx rt_check.ml rt_check.cmi rt_check.cmo

  $ ../../main.exe reactmodal_external.rei -o rt_out.mli
  $ ocamlformat --enable-outside-detected-project rt_out.mli > rt_fmt.mli
  $ diff rt_out.mli rt_fmt.mli
  $ cp rt_out.mli rt_check.mli
  $ ocamlfind ocamlc -c rt_check.mli 2>&1 | grep -v 'Cannot read directory' || true
  $ rm -f rt_out.mli rt_fmt.mli rt_check.mli rt_check.cmi
