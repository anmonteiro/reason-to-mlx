The converter used to change comment text in some files. Every case
reduced to one root cause: `escape_ocaml_comment` in main.ml inserted a space
right after every `{` character it found in comment text, with no check for
what follows.

The real rule, from parsing/lexer.mll's `comment` lexer, is narrower: a `{`
only matters there when it opens an OCaml quoted-string literal, the same
`{delim|...|delim}` syntax `{js|...|js}` strings use. A `{` followed by a
lowercase delimiter and a `|` starts one of those strings; everything after
it, including a `{` that would otherwise need its own space, is inert text
until the matching `|delim}` closer. If that closer is missing, the lexer
keeps hunting for it past this comment's own `*)` and into whatever code
follows, so only then does the comment text need a space to break the
opener. Escaping every `{` broke the closed case; the converter now escapes
only the unclosed one.

A `{` immediately followed by an identifier, as in a JSX prop value or a
record expression written inside a comment (real code, commented out with
`//`), was never a quoted-string opener (no `|` follows the identifier), so
it keeps its original text with no space inserted.

  $ ../../main.exe line_comment_prop.re -o line_comment_prop.actual.mlx
  $ diff -u line_comment_prop.mlx line_comment_prop.actual.mlx

A `{js|...|js}` quoted-string delimiter, used throughout this codebase for
non-ASCII string literals, is closed by its own `|js}`, so it round-trips
byte-identical too.

  $ ../../main.exe quoted_string_delimiter.re -o quoted_string_delimiter.actual.mlx
  $ diff -u quoted_string_delimiter.mlx quoted_string_delimiter.actual.mlx

When the source comment already has a single space after `{`, as plain
prose or an example snippet inside a `/** ... */` doc comment normally does,
that `{` isn't a quoted-string opener either (a space isn't a valid
delimiter character), so the space is no longer doubled.

  $ ../../main.exe doc_comment_record.re -o doc_comment_record.actual.mlx
  $ diff -u doc_comment_record.mlx doc_comment_record.actual.mlx

An unclosed `{|` (an empty delimiter, still valid) is the one shape that
still needs the space: nothing in the rest of this comment closes it, so
left alone it would make the OCaml lexer treat everything after as string
content, never finding `*)`.

  $ ../../main.exe unclosed_delimiter.re -o unclosed_delimiter.actual.mlx
  $ diff -u unclosed_delimiter.mlx unclosed_delimiter.actual.mlx

That escaped output parses: running it back through the formatter succeeds
instead of raising "This comment contains an unterminated string literal",
which is what the unescaped `(* {| *)` does.

  $ ../../main.exe unclosed_delimiter.re -o unclosed_out.mlx
  $ ocamlformat-mlx --enable-outside-detected-project unclosed_out.mlx
  (* { | *)
  let x = 1
  $ rm -f unclosed_out.mlx

All four outputs above now match the comment text as written in the source,
except where OCaml itself leaves no choice (the unclosed delimiter case).
This is what the three PR commits above restored by hand across
BannerConfig.mlx, DropdownSelect.mlx, UserCountCTA.mlx,
CommonDataContext.mlx, TrialPlan.mlx, DateUtils.mlx, and OnPageSeo.mlx.
