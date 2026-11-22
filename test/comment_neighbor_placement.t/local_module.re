let f = () => {
  // BEFORE_MODULE
  module M = {
    let x = 1;
  };
  open Foo; // AFTER_OPEN
  M.x
};
