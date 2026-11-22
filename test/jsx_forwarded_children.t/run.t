A self-closing JSX element whose own `make` declares `~children=?`, used
while also forwarding an in-scope `children` by punning (`?children`). Two
toolchains disagree on the raw argument list for this call.

refmt (Reason's own parser) always appends a literal `~children:[]` for "no
nested JSX children" on a self-closing tag, even when `children` is already
present among the other props, so its expansion carries the label twice:
`?children ... ~children:[] ()`. mlx-pp (what the real dune build runs on
this converter's `.mlx` output) does not duplicate the label: it prints a
single `?children`.

Built both sides of this exact shape, plus the 7 real corpus files
(Toggle_Doc.re, Checkbox.re, Checkbox_Doc.re, Checkbox_Indeterminate_Doc.re,
ButtonGroup_Custom_Doc.re, ChFieldsRequestDescr.re, TopBarHeader_Doc.re),
through a real Melange preprocess chain (server-reason-react.ppx,
reason-react-ppx, melange.ppx) down to the emitted `.bs.js`: the
`[@react.component]` ppx that expands `createElement` collapses the
duplicate `children` label into the same single assignment either way, so
the compiled JS is byte-identical for every one of those files wherever
`children` is involved. (The `.bs.js` files for those 7 do differ in one
unrelated, already-documented way: curried functions compiled flat.) The missing `~children:[]` below is
confirmed inert, not a bug; this test pins the converter's current output
for the shape.

  $ ../../main.exe input.re -o actual.mlx
  $ diff -u output.mlx actual.mlx
