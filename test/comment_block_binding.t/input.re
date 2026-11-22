let top = {
  // top comment
  let c = 1.2;
  c;
};

let f = () => {
  let a = foo(1);

  let b = {
    // let comment
    let c = 1.2;
    c;
  };
  b;
};

let h = () => {
  let a = foo(1);
  let b =
    // plain comment
    bar(a);
  b;
};

let i = (x) => {
  let a = foo(x);
  let b = {
    // sequence comment
    ignore(a);
    a;
  };
  b;
};
