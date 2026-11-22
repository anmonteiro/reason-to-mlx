let f = x => {
  let a = foo(x);
  let b = bar(x);
  // leading comment
  let (c, d) = baz(a, b);
  a + b + c + d;
};
