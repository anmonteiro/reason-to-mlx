let f = (x) =>
  switch (x) {
  | `URL => [
      // only filter by current
      1,
    ]
  | `Other => []
  };
