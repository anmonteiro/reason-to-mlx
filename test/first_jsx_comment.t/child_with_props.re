let view = () =>
  <Foo
    a=1
    b=2>
    // leads the first child
    <A />
    <B />
  </Foo>;
