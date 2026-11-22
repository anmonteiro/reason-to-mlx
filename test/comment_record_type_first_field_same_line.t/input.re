type t = {
  /* K1 */ a: int,
  b: int,
};

type u = { /* K2 */ a: int, b: int };

type v =
  | A({
    // K3
    a: int,
    // K4
    b: int,
  })
  | B({ /* K5 */ a: int, b: int })
  | C({
      a: int, // K6
      // K7
      b: int,
    });
