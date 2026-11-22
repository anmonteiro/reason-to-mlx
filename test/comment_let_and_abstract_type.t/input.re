let rec a = x =>
  switch (x) {
  | 0 => 1
  | n => b(n - 1)
  }

// about b
and b = x => a(x);

let f = () => {
  let k = 1;
  let rec go = n => n == 0 ? 0 : stop(n - 1)
  // about stop
  and stop = n => go(n);
  go(k);
};

let g = () => {
  let k = 1;

  // keeps the function sugar
  let add = (~by, x) => x + by + k;
  add(~by=1, 2);
};
