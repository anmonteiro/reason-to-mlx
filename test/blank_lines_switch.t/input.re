let describe = x =>
  switch (x) {
  | 1 => "one"

  | 2 => "two"
  | 3 =>
    let label = "three";

    let suffix = "!";
    label ++ suffix;
  | _ => "other"
  };
