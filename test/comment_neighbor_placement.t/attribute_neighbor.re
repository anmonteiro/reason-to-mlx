[@deriving enumerate]
// BEFORE_TYPE
type t = | A | B;

type message = {
  text: string,
  [@mel.as "type"]
  // BEFORE_FIELD
  type_: string,
};
