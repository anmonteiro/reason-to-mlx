let before = 0;
/* between before and WithBlanks: no source blank, so none is expected */
module WithBlanks = {
  let a = 1;

  let b = 2;
  let c = 3;
  /* between c and d: no blank before this comment, one blank after it */

  let d = 4;
};

module Outer = {
  module Inner = {
    let x = 1;

    let y = 2;
  };

  let z = Inner.y;
};

module type Measure = {
  type t;

  let isImprovement: t => bool;
  let shouldShow: t => bool;
};

module BuildBadge = (Source: Measure) => {
  let tone = 1;

  let render = 2;
};

include {
  let p = 1;

  let q = 2;
  let r = 3;
};
/* between the include above and after: a source blank, so one is expected */

let after = 1;
