type t = [
  // FIRST
  | `a
  | [@as "b-b"] `b
  // SECOND
  | `c
  // THIRD
  | [@as "d-d"] `d
];
