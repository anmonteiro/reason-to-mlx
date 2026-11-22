type pair = Pair(int, string);
type optionalPair = option((int, string));
type outcome = result((int, string), string);

external keepTypeAttribute: ([@keep.type] int) => int = "";
external stripTypeAttribute: ([@explicit_arity] int) => int = "";

let constructorExpressions = (
  Pair(1, "one"),
  Some((2, "two")),
  Ok((3, "three")),
  Error("bad"),
);

let inspect = value =>
  switch (value) {
  | [@keep.pattern] Some((number, label)) =>
    [@keep.expression] Ok(Pair(number, label))
  | None => Error("missing")
  };
