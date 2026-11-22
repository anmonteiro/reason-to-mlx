let afterOpen = x => {
  open Foo;

  let a = x;
  a;
};

let afterLocalModule = x => {
  module M = Bar;

  M.run(x);
};

let betweenCases = x =>
  switch (x) {
  | A => 1

  | B => 2
  };

type fields = {
  a: int,

  b: int,
};

let record = {
  a: 1,

  b: 2,
};
