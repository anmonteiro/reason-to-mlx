type t = {mutable effect: int};

let bump = (r) => r.effect = r.effect + 1;
