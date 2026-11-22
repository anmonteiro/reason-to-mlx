let f = column =>
  switch (column) {
  | A
  | B
  /* c1 */
  | C
  | D => ""
  | E => "e"
  };

let g =
  fun
  | A(x)
  | B(x)
  // c2
  | C(x) => x
  | _ => 0;

let h = x =>
  switch (x) {
  | A
  | B // c3
  | C => 1
  | D => 2
  };
