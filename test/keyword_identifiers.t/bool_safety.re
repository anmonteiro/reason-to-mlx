type t = {
  effect: int,
  flag: bool,
};

let r = {effect: 1, flag: true};

let f = (r) =>
  switch (r.flag) {
  | true => r.effect
  | false => 0
  };
