module Empty = {
  // EMPTY_MODULE
};

module Nested = {
  // NESTED_HEADER
  let value = 1;
  // NESTED_TRAILING
};

let choose = flag =>
  switch (flag) {
  | true => 1
  | false => {
      // FALSE_BRANCH
      2;
    }
  };
