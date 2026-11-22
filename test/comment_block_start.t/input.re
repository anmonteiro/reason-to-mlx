let useBody = () => {
  /* first in the body */
  1;
};

let matchBody = switch (flag) {
  | true => 1
  | false => {
      // first in the case
      2;
    }
};

let nested = {
  let first = 1;
  /* before the second */
  let second = 2;
  first + second;
};
