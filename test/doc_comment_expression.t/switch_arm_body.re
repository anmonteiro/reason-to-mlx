let f = x =>
  switch (x) {
  | Some(y) =>
    /** Doc on the arm body. */
    y + 1
  | None => 0
  };
