let twoStatements = () => {
  foo();

  bar();
};

let threeStatements = () => {
  foo();
  bar();

  baz();
};

let afterBlockStatement = x => {
  if (x) {
    a();
  };

  b();
};

let insideBranches = x => {
  if (x) {
    a();

    b();
  } else {
    c();

    d();
  };
};

let insideCase = x =>
  switch (x) {
  | A =>
    a();

    b()
  | B => c()
  };

let insideLoops = () => {
  for (i in 0 to 3) {
    a();

    b();
  };

  while (true) {
    c();

    d();
  };
};

let bindingOperator = x => {
  let.await a = foo(x);
  let.await b = foo(a);

  bar(b);
};

let noBlank = () => {
  foo();
  bar();
};
