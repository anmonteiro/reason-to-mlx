let f = (x, y) =>
  switch (x, y) {
  | (Some(a), _)
      // explains the guard
      when a > 0 => 1
  | _ => 0
  };
let g = r =>
  switch (r) {
  | {
      plan: A | B,
      // explains the next field
      chartPermissions: `No,
      other: _,
    } => 1
  | _ => 0
  };
