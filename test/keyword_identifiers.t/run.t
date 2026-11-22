OCaml 5 reserves a handful of words, most importantly `effect` (OCaml 5's
effect handlers), that Reason still accepts as plain lowercase identifiers.
Reason's own ML bridge printer does not know about these OCaml-5-only
keywords and prints them bare, which an OCaml-5-aware parser then rejects
in every binding and reference position. The fix rewrites the name to its
raw-identifier spelling (`\#effect`), which survives both re-parses.

A type's own name.

  $ ../../main.exe type_name.re -o type_name.actual.mlx
  $ diff -u type_name.mlx type_name.actual.mlx

A type used as another type's argument.

  $ ../../main.exe type_use.re -o type_use.actual.mlx
  $ diff -u type_use.mlx type_use.actual.mlx

A plain value binding.

  $ ../../main.exe value_binding.re -o value_binding.actual.mlx
  $ diff -u value_binding.mlx value_binding.actual.mlx

A function parameter, and the same name used in the body.

  $ ../../main.exe fn_param.re -o fn_param.actual.mlx
  $ diff -u fn_param.mlx fn_param.actual.mlx

A labelled argument.

  $ ../../main.exe labelled_arg.re -o labelled_arg.actual.mlx
  $ diff -u labelled_arg.mlx labelled_arg.actual.mlx

A record field: declaration, construction, pattern destructuring, and dot
access.

  $ ../../main.exe record_field.re -o record_field.actual.mlx
  $ diff -u record_field.mlx record_field.actual.mlx

A mutable record field assigned through `<-`.

  $ ../../main.exe mutable_field.re -o mutable_field.actual.mlx
  $ diff -u mutable_field.mlx mutable_field.actual.mlx

A polymorphic type variable spelled with the keyword.

  $ ../../main.exe type_var.re -o type_var.actual.mlx
  $ diff -u type_var.mlx type_var.actual.mlx

An explicitly rank-2-polymorphic record field: the quantifier list in
`Ptyp_poly`, not just the `Ptyp_var` uses inside its body.

  $ ../../main.exe poly_field.re -o poly_field.actual.mlx
  $ diff -u poly_field.mlx poly_field.actual.mlx

A module-qualified reference.

  $ ../../main.exe module_qualified.re -o module_qualified.actual.mlx
  $ diff -u module_qualified.mlx module_qualified.actual.mlx

`external` declares a value name exactly like `let`, and goes through the
same value_description node as a `.rei` `val`.

  $ ../../main.exe external.re -o external.actual.mlx
  $ diff -u external.mlx external.actual.mlx

A `.rei` value declaration (`val` in the OCaml bridge).

  $ ../../main.exe interface.rei -o interface.actual.mli
  $ diff -u interface.mli interface.actual.mli

`true` and `false` are themselves OCaml keywords, but as boolean literals
they are constructors, not renameable identifiers: escaping them would
corrupt every boolean in the file. This is a regression guard: an earlier,
overly general version of the fix rewrote them to `\#true` / `\#false`.

  $ ../../main.exe bool_safety.re -o bool_safety.actual.mlx
  $ diff -u bool_safety.mlx bool_safety.actual.mlx

A real-shape reduction of the one corpus file this bug hit
(AgentEngineFrame.re), which a human
previously routed around by hand-renaming `effect` to `engineEffect`
before committing.

  $ ../../main.exe agent_engine_frame_reduced.re -o agent_engine_frame_reduced.actual.mlx
  $ diff -u agent_engine_frame_reduced.mlx agent_engine_frame_reduced.actual.mlx

OCaml's keyword operators (`mod`, `land`, `lor`, `lxor`, `lsl`, `lsr`,
`asr`) are keywords too, but in `a mod b` the keyword is the operator, so it
stays as written. `effect` next to it is still escaped.

  $ ../../main.exe keyword_operators.re -o keyword_operators.actual.mlx
  $ diff -u keyword_operators.mlx keyword_operators.actual.mlx

Every `.re` fixture's output must parse and be stable under ocamlformat-mlx
(reformatting it must reproduce the same text, with no error), and must
type-check standalone: every fixture above is self-contained, so no stub is
needed beyond the fixture itself.

  $ for f in *.re; do
  >   ../../main.exe "$f" -o rt_out.mlx 2>rt_err.log \
  >     || { echo "CONVERTER ERROR on $f:"; cat rt_err.log; continue; }
  >   ocamlformat-mlx --enable-outside-detected-project rt_out.mlx \
  >     > rt_fmt.mlx 2>rt_fmt_err.log \
  >     || { echo "FORMATTER ERROR on $f:"; cat rt_fmt_err.log; continue; }
  >   diff rt_out.mlx rt_fmt.mlx > /dev/null \
  >     || { echo "ROUND-TRIP DIFF on $f:"; diff rt_out.mlx rt_fmt.mlx; }
  >   cp rt_out.mlx rt_check.ml
  >   ocamlfind ocamlc -c rt_check.ml > rt_ocamlc.log 2>&1 \
  >     || { echo "TYPE ERROR on $f:"; cat rt_ocamlc.log; }
  > done
  $ rm -f rt_out.mlx rt_fmt.mlx rt_err.log rt_fmt_err.log rt_check.ml rt_check.cmi rt_check.cmo rt_ocamlc.log

The `.rei` fixture must parse and be stable under plain `ocamlformat` (a
`.mli` signature has no JSX to format, so `ocamlformat-mlx` is not the right
check here, matching interface.t's convention).

  $ ../../main.exe interface.rei -o rt_out.mli
  $ ocamlformat --enable-outside-detected-project rt_out.mli > rt_fmt.mli
  $ diff rt_out.mli rt_fmt.mli
  $ cp rt_out.mli rt_check.mli
  $ ocamlfind ocamlc -c rt_check.mli 2>&1 | grep -v 'Cannot read directory' || true
  $ rm -f rt_out.mli rt_fmt.mli rt_check.mli rt_check.cmi
