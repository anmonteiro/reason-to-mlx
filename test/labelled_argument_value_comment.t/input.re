let lambda = f(
  ~x=1,
  ~toString=
    // K1
    fun
    | A => "a"
    | B => "b",
  ~y=2,
);

let call = f(
  ~x=1,
  ~color=
    // K2
    index->Option.map(i => i),
  (),
);

let sameLine = f(~x=1, ~color= /* K3 */ index, ());
