let view = () =>
  <div>
    {switch (x) {
     | A => <A />
     | B => <B />
     }}
    // note
    <div ref=r> {foo} </div>
  </div>;
