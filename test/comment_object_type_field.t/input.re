type userValid = {
  .
  // k1
  "kind": string,
  // k2
  "tries": int,
  "last": Js.Nullable.t(int), // k3
  // k4
  "other": bool,
};

type t2 = {
  .
  "a": int,
  /* k5 */ "b": int,
};
