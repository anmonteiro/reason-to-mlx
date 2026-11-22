module M = {
  [@live "x"]
  // c1
  let a = 1;

  [@dead "y"]
  /* c2 */
  let b = (x) => x;

  [@alert "z"]
  // c3
  let c = (x) => {
    x
  };

  [@live "w"]
  // c4
  type t = int;

  [@mel.module "m"]
  // c5
  external e: int => int = "e";

  [@live "a"]
  // c6
  [@dead "b"]
  // c7
  module N = {
    let z = 1;
  };
};

[@live]
// c8
exception E(int);
