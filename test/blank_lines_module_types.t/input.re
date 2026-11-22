type state = {count: int};

let update: (state, int) => state;
let reset: state => state;

module Nested: {
  let make: int => int;

  let helper: int => int;
};

open Belt;
open List;

let last: int;
/* between last and finalVal: no source blank before this comment, one after */

let finalVal: int;
