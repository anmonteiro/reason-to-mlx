let f = x =>
  switch (x) {
  | A => 1
  // Or-pattern case.
  | B | C => 2
  // Guarded case.
  | D when x == D => 3
  };
