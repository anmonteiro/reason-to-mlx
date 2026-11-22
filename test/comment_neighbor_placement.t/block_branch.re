let f = x =>
  if (x) {
    1 // THEN_COMMENT
  } else {
    2 // ELSE_COMMENT
  };
let g = x =>
  if (x) {
    1
  } else if (y) {
    2 // ELSE_IF_COMMENT
  } else {
    3 // LAST_ELSE_COMMENT
  };
