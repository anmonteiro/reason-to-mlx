let rec findGroup = (rest: list(int)): int =>
  switch (rest) {
  // Default group for any new tool will be Writing
  | [] => 0
  | [x, ..._rest] => x
  };
