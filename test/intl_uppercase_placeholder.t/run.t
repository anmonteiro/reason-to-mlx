Every uppercase placeholder in one message is renamed, together with its
matching object key.

  $ ../../main.exe input_multi.re -o input_multi.actual.mlx
  $ diff -u input_multi.mlx input_multi.actual.mlx

A `{Name, plural, ...}` argument name is a placeholder too, not a value:
only the argument name is renamed, the plural branches stay untouched.

  $ ../../main.exe input_plural.re -o input_plural.actual.mlx
  $ diff -u input_plural.mlx input_plural.actual.mlx

An uppercase quoted key that is not also an intl placeholder anywhere in
the file is unaffected: it keeps today's generic rename and `[@mel.as]`.

  $ ../../main.exe input_non_intl.re -o input_non_intl.actual.mlx
  $ diff -u input_non_intl.mlx input_non_intl.actual.mlx

A rename is scoped to the object an `intl.s`/`intl.el` use actually reads.
`config` below has the same quoted key as `seoTitle`'s own object, but
`seoTitle` never reads `config`, so `config` keeps its key and `[@mel.as]`;
only the object that feeds the message loses it.

  $ ../../main.exe input_unrelated.re -o input_unrelated.actual.mlx
  $ diff -u input_unrelated.mlx input_unrelated.actual.mlx

A plural clause's branch word is never a placeholder, even when it spells
the same name as the object's key: only the clause's own argument name
(`count` here) is a real placeholder, so the key `Tool` is not an eligible
rename target and keeps `[@mel.as]`. The branch text `{Tool}` stays
untouched in the message, exactly as the source wrote it.

  $ ../../main.exe input_plural_collision.re -o input_plural_collision.actual.mlx
  $ diff -u input_plural_collision.mlx input_plural_collision.actual.mlx

A let-bound object is renamed the same way, keeping every place that reads
the placeholder in sync, as long as the binding is used only as an intl
value (see `corpus_quoted_keys.t`'s `input_intl_bound.re`). Once a second,
non-intl reference exists, as `y` does here, the rename is refused for the
whole binding: `sharedValues` keeps `[@mel.as]`, and the message keeps the
uppercase `{Tool}`.

  $ ../../main.exe input_bound_escapes.re -o input_bound_escapes.actual.mlx
  $ diff -u input_bound_escapes.mlx input_bound_escapes.actual.mlx

This output still does not type-check against melange-react-intl's ppx:
the ppx builds the message's values type from the placeholder text
verbatim, so it expects a field named `Tool` (uppercase), but no concrete
OCaml syntax can declare or read a record field starting with an
uppercase letter. Fixing it requires a source change (rename the key, or
stop sharing `sharedValues` outside `x`), not a converter choice between
two already-wrong renames.
