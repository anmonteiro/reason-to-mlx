  $ ../../main.exe input.re -o actual.mlx
  $ diff -u output.mlx actual.mlx

`to` is both a quoted object key and an OCaml keyword. The generic
quoted-key rename (`to_` plus `[@mel.as "to"]`) does not type-check here:
`[@mel.as]` only renames the compiled JS key, it does not change the OCaml
object type that `[%mel.obj]` infers for `values`, which would still keep
the field named `to_`. The co-located `[%intl.el]` placeholder `{to}`
expects an object typed with a field literally named `to` (an object type
printed with the `\#to` raw-identifier escape, since `to` alone cannot be
printed as a field name). Applying `values` to that function would fail
with "This expression has type ... to_ : ... but an expression was
expected of type ... \#to : ... The second object type has no method
to_".

Since `to` is already a valid identifier once escaped, the converter keeps
it as the OCaml keyword itself, using the raw-identifier escape it already
emits for a keyword used as an object type field or a labelled argument
(see `escape_keyword` in main.ml): `\#to = RR.s (Format.day growth.asOf)`,
with no `[@mel.as]` attribute at all. This form type-checks against the
`[%intl.el]` placeholder, and the pinned mlx-pp parses and prints `\#to`
without error, confirmed by building this reduced snippet through the real
`melange-react-intl.ppx` and `server-reason-react.melange_ppx` chain used
by the source file.
