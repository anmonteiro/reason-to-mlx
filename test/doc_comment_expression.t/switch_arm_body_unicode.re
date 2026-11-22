let f = x =>
  switch (x) {
  | Some(y) =>
    /** Doc on the arm body — with an em dash. */
    y + 1
  | None => 0
  };
