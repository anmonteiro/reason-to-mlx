let key = switch (code) {
  | 13 /* enter */ => save()
  | 27 /* esc */ => close()
  | _ => ()
};

let fields = switch (v) { | Some(a) => a | None /* no value */ => 0 };

let tag = switch (v) { | `A /* first tag */ => 1 | `B(n) /* second tag */ => n };

let rest = switch (v) { | A => 1 | /* the last case */ B(x, y) => x + y };

let lead /* after the name */ = 1;

let (a, /* leads b */ b) = pair;

let f = (a /* after a */, /* before b */ b) => a + b;
