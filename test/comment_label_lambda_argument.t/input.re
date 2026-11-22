let y = f(
  ~first=1,
  // K1
  ~second=(x) => x + 1,
  // K2
  ~third=(x) => { // K3
    x + 1
  },
);
let z = f(
  // K4
  ~first=(x) => { x + 1 },
);
