let a = (x) =>
  switch (x) {
  | [ // K1
      1,
      2,
    ] => 3
  | _ => 4
  };

let b = (x) =>
  switch (x) {
  | [// K2
1, 2] => 3
  | _ => 4
  };

let c = (x) =>
  switch (x) {
  | [/* K3 */ a, b] => 3
  | [1, ...r /* K4 */] => 4
  | _ => 5
  };

let [/* K5 */ d, e] = x;
