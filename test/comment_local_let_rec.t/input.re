let x = {
  // K1
  let rec lastTwo = (lst: list('a)): list('a) => lst;
  // K2
  let rec a = (x) => b(x)
  // K3
  and b = (x) => a(x);
  lastTwo
};
