let f = () => {
  let first = 1;

  // Explains the polymorphic function below.
  let poly: type a. (a, a) => a = (x, _) => x;

  poly(first, first);
};
