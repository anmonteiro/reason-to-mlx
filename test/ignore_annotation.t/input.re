let f = (x: int) => x->ignore;
let g = x => x->ignore;
let h = (~x: string, ()) => ignore((x: string));
let i = (x: _) => x->ignore;
let j = (x: 'a) => x->ignore;
let k = (x: int => int) => x->ignore;
let l = () => {
  let y: list(int) = [];
  y->ignore;
};
let m = () => {
  let y = 1;
  y->ignore;
};
let n = (x: int) => {
  let x = foo();
  x->ignore;
};
let o = (x: option(string)) => (fun | Some(x) => x->ignore | None => ())(x);
let p = (x: int) => f(x)->ignore;
let q = (x: unit) => x->ignore;
let r = (~x: string, ()) => x->ignore;
let s = (x: int) => ignore(x);
let t = (x: Js.Global.timeoutId) => x->ignore;
