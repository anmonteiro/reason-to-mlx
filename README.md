# reason-to-mlx

`reason-to-mlx` parses Reason implementations (.re) and emits mlx syntax (.mlx). It converts Reason interfaces (.rei) to OCaml interfaces (.mli).

It's an improvement over raw `refmt --print ml` where some of the conversion needs a bit of polish to represent exactly the same as the original code.

## Features

`reason-to-mlx` supports all OCaml syntax that Reason can parse. It also:

- Keeps JSX syntax as JSX instead of `[@JSX]` attributes.
- Removes Reason-only attributes such as `reason.preserve_braces` and `explicit_arity`.
- Keeps comments and documentation comments. A doc comment only keeps its
  `(** ... *)` attribute form where OCaml has a documentable position for it
  (a structure or signature item, a `let` binding at any depth, a record
  field); before any other expression (a sequence statement, a `switch` arm
  body, ...) it prints as a plain, repositioned `(* ... *)` comment instead,
  the same as a doc comment before a bare top-level expression statement.
- Keeps blank lines between structure and signature items (also inside modules and after a file's header comment), `let` bindings, and `;` statements. It does not keep them between match cases, record fields, list or array elements, or JSX children. A doc comment followed by a blank line prints as a floating doc comment.
- Keeps JSX comments inside their parent element, in order between children and after the last child.
- Prints a comment that starts its own line before the first statement of a `let` value, or of a lambda argument's body, on its own line. It does not trail the code before it.
- Attaches a comment on its own line to the next node, not the previous one. A same-line comment is the exception: it stays trailing the parameter or type it follows, unless another parameter or type starts on that same line, in which case it leads that one instead. A function's own return-type constraint never receives a comment that is actually inside the body.
- Keeps a comment that is followed by an expression, pattern or type annotation, with only whitespace and opening brackets between them, in front of that node: `f(a, /* c */ b)`, `x => /* c */ body`, `| /* c */ Some(a)`, `let r: /* c */ int`. A comment followed by a separator or an operator (`a /* c */, b`, `a /* c */ + b`) trails the node before it. A comment that is the first thing in a `{ ... }` block leads the block's value.
- Prints a comment before a `switch` case pattern on its own line above the `|`, and one after a case pattern before the `=>` arrow. A comment before a type parameter prints after the previous parameter, and after the only parameter it prints above the `type` item, because the formatter cannot place a comment elsewhere in a type header.
- Does not place a comment that leads the first child of a JSX element, or sits inside a JSX tag, at its source position. It prints it after the last child (see the JSX comment bullet above). A comment before a JSX element that is not a child, such as a prop value, a `let` value or a `switch` arm body, stays before the element.
- Keeps comment text as written. It doubles `"` only when a comment leaves a string literal open, and puts a space inside `(*` and `*)` only when they do not nest. A run of own-line `//` comments that leaves a string open on one line and closes it on a later line prints as one block comment. A moved multi-line comment keeps its continuation lines aligned with its first line.
- Prints an own-line comment between two function parameters on its own line, before the parameter it leads.
- Prints a Reason `_` placeholder pipe, `x->f(a, _)`, as `f a x`. It keeps `x |. fun __x -> f a __x` when `x` and another argument are both calls, because the call form changes which one runs first.
- Keeps non-ASCII text and escapes such as `\xNN` in plain string literals as written, instead of printing each byte >= 0x80 as a decimal escape.
- Prints `[@@react.component]` and its variants as `let[@react.component] ...`.
- Prints `<>a b</>` and `<></>` as mlx fragments. It prints a written `<React.Fragment>` as is.
- Prints a non-list `children=x` prop as `<Foo>...x</Foo>`, without the second `~children:[]` that Reason adds.
- Prints `x->ignore` and `ignore(x)` as `ignore (x : T)` when `x` is an identifier and the nearest binder of `x` in the file has the annotation `T`. The converter skips `_`, type variables, arrow types and `unit` as `T`, and prints `ignore x` instead. It does not infer types.
- Stops with an error naming the operator and the Reason line for an operator that mlx 0.12 lexes as two tokens: a name that starts with `<><`, `<>...`, `</><`, `</>...` or `>...`. The exit code is non-zero.
- Keeps nested application boundaries when later arguments are labelled.
- Keeps `[@u]` on uncurried functions and calls.
- Prints a Reason return type in the function header: `let f (x : int) : t = body`, not `let f x = (body : t)`.
- Escapes OCaml keywords used as labels or object fields.
- Restores `let%melange_only` and `match%platform` short syntax.
- Keeps a chain of two or more pipes, and a single pipe with a labelled or optional argument, as `|.`: `dict->f(a)->g(b)` prints as `dict |. f a |. g b`, and `xs->f(~label=v)` prints as `xs |. f ~label:v`. That form can type `v` before `xs`, so a lambda in `v` that reads record fields may fail to typecheck where Reason did not; the build reports it, and `(xs |. f) ~label:v` or a type annotation on the lambda fixes it.
- Renames quoted JavaScript object keys to valid OCaml field names, and keeps the original key with `[@mel.as]`. It stops with an error naming the key and the Reason line when a key has no valid field name, such as `"1279"`. The exit code is non-zero.
- Merges curried parameters into one `let`, except inside `melange_only`.
- Converts `let.await` and `and.await` to `let*` and `and*`.
- Reassociates the operators given in `--associative-operators`.

## Install, build, test

Install the dependencies, including the test tools, into the current opam switch:

```
$ opam install . --deps-only --with-test
```

Build and run the cram tests in `test/`:

```
$ dune build
$ dune test
```

Convert a file:

```
$ dune exec ./main.exe -- Component.re -o Component.mlx
```

## Flags

Run `dune exec ./main.exe -- --help` to print this list from the binary.

### Positional `FILE`

Format: a file path, or `-`, given without a flag name.
Default: standard input.

Reads Reason source from `FILE` instead of standard input.

### `-o FILE`, `--output=FILE`

Format: a file path, or `-`.
Default: standard output.

Writes the MLX output to `FILE` instead of standard output.

The converter also reads the input file's extension to pick interface or
implementation grammar, and to select the matching `.ocamlformat` profile.
It does this even when `-o` is absent and the output goes to standard
output. A `.rei` input prints interface syntax; any other input prints
implementation syntax:

```
$ dune exec ./main.exe -- greet.re
let greet name = "hello " ^ name

$ dune exec ./main.exe -- greet.rei
val greet : string -> string
```

### `--associative-operators=OPERATORS`

Format: a comma-separated list of infix operator names, for example `+++,<+>`.
Default: empty. The converter reassociates no operator.

For each named operator, the converter regroups a chain of that operator so
that it nests to the left: `a op (b op c)` becomes `(a op b) op c`. For a
left-associative operator, such as `+` or `+++`, OCaml prints that without
parentheses. Name only operators that are associative, because regrouping
changes the result of an operator such as `-`.

Do not name a right-associative operator, such as `^` or `@`. OCaml already
prints `a ^ (b ^ c)` as `a ^ b ^ c`. With `--associative-operators=^`, the
same input prints as `(a ^ b) ^ c`.

Name the operator by its OCaml spelling. The converter renames some Reason
operators before this step. For example, Reason's `++` becomes OCaml's `^`.

```
$ dune exec ./main.exe -- --associative-operators=+++ Component.re
```

Before, with the flag omitted:

```
let result = a +++ (b +++ c)
```

After, with `--associative-operators=+++`:

```
let result = a +++ b +++ c
```
