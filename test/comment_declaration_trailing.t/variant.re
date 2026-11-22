type direction =
  | Up // UP_COMMENT
  | Down // DOWN_COMMENT
  | Left; // LEFT_COMMENT
let after = 1;

[@deriving toString]
type size =
  | Small // SMALL_COMMENT
  | Large; // LARGE_COMMENT
