[%%raw "const x = 1;"];
let f = () => {
  /* FUNCTION_BODY */
  1;
};

module Nested = {
  [%%raw "const y = 2;"];
  let g = () => {
    /* NESTED_FUNCTION_BODY */
    2;
  };
};
