let letChain = () => {
  let a = 1;

  let b = 2;
  b;
};

let sequence = () => {
  print_string("a");

  print_string("b");
  print_string("c");
};

let labelled = (~label, ~disabled=false, ()) => {
  let a = label;

  let b = disabled;
  b;
};

let rec isEven = n =>
  if (n == 0) {
    true;
  } else {
    isOdd(n - 1);
  }
and isOdd = n =>
  if (n == 0) {
    false;
  } else {
    isEven(n - 1);
  };

let withCallback = () =>
  List.map(
    x => {
      let doubled = x * 2;

      let tripled = x * 3;
      doubled + tripled;
    },
    [1, 2, 3],
  );
