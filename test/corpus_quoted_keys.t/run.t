  $ ../../main.exe input.re -o input.actual.mlx
  $ diff -u input.mlx input.actual.mlx

`"type"` and `"method"` are both quoted keys and OCaml keywords. The
converter keeps each as the keyword itself, using the `\#type`/`\#method`
raw-identifier escape, with no `[@mel.as]`: see
`corpus_quoted_keyword_key.t` for why a keyword key cannot take the
generic `type_`/`[@mel.as "type"]` rename once it is also an `intl`
placeholder, and the same mismatch applies without `intl` too, since
`[@mel.as]` only renames the compiled JS key, not the OCaml-visible one.

An object key that also appears as an `{Interpolation}` placeholder in an
`intl.s`/`intl.el` string is a different case: `[@mel.as]` cannot help
here either, because the placeholder names the object type's field
directly, by the exact text between the braces, so the renamed field and
the placeholder must spell the same name. A key that starts uppercase is
invalid as an OCaml field regardless of `intl`; when it is also a
placeholder, the fix is to lowercase the key's first letter in both
places together, dropping `[@mel.as]` since the compiled JS key now has to
equal the placeholder too.

  $ ../../main.exe input_intl.re -o input_intl.actual.mlx
  $ diff -u input_intl.mlx input_intl.actual.mlx

A bound object is renamed the same way, keeping every place that reads the
placeholder in sync, as long as the binding is used only as this one
`intl` value (see `test/intl_uppercase_placeholder.t` for the case where
it escapes that use and the rename is refused instead).

  $ ../../main.exe input_intl_bound.re -o input_intl_bound.actual.mlx
  $ diff -u input_intl_bound.mlx input_intl_bound.actual.mlx
