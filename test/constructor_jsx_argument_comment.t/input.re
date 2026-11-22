let some = Some(
  // K1
  <A />
);

let someWithChildren = x => Some(
  // K2
  <A> <B /> </A>
);

let sameLine = Some(/* K3 */ <A />);

let afterElement = Some(<A />); // K4

let custom = Custom(
  // K5
  <A />
);

let ternary = cond ? Some(
  // K6
  <A />
) : None;

let call = f(
  // K7
  <A />
);
