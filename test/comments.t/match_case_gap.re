let view = flag =>
  switch (flag) {
  | 0 =>
    <>
      <A />
    </>
  // Documents the fragment case below.
  | 1 =>
    <>
      <B />
    </>
  // Documents the plain element case below.
  | _ =>
    <C />
  };
