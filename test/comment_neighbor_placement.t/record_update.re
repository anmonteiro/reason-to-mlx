let f = state => {
  ...state,
  a: foo(1),
  // BEFORE_B
  b: 2,
  // BEFORE_C
  c: 3,
};
