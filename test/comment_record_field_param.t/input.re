let a = {
  a: f(1),
  // section two
  b: g(2),
  // about a path
  M.c: (1, 2),
  // about nested
  e: {
    f: 1,
    // about g
    g: [1],
  },
};
let b = {
  ...a,
  // about the first updated field
  a: 1,
  // about the second
  b: 2,
};
let make =
    (
      ~a: int,
      // heading for b
      ~b: bool=false,
      // heading for c
      ~c: option(string)=?,
      // heading for d
      ~d=1,
    ) => a;
