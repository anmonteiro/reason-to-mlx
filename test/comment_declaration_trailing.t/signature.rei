module type S = {
  let a: int; // VAL_COMMENT
  let b: int; // SECOND_VAL_COMMENT
  type t; // TYPE_COMMENT
};
type direction =
  | Up // UP_COMMENT
  | Down; // DOWN_COMMENT
