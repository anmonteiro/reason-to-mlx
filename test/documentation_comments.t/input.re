/** Top-level documentation. */
let answer = 42;

type profile = {
  /** Field documentation. */
  name: string,
  active: bool,
};

type status =
  | /** Constructor documentation. */ Ready
  | Failed;

/** Module documentation. */
module Nested = {
  /** Nested value documentation. */
  let value = 1;
};

/** Café documentation in 東京. */
let greeting = "hello";
