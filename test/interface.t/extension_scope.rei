[%%raw "interface payload"];
/* AFTER_SIGNATURE_EXTENSION */
let value: int;

module Nested: {
  [%%raw "nested signature payload"];
  /* AFTER_NESTED_SIGNATURE_EXTENSION */
  let value: string;
};
