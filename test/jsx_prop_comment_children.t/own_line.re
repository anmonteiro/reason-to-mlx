let noChildren = <A
  x={<B />}
  // K1
  y="k"
/>;

let oneChild = <A
  x={<B />}
  // K2
  y="k">
  <C />
</A>;

let stringChild = <A
  x={<B />}
  // K3
  y="k">
  {React.string("a")}
  <C />
</A>;

let betweenChildren = <A
  x={<B />}
  // K4
  y="k">
  <C />
  // K5
  <C />
</A>;

let jsxValue = <A
  x={<B />}
  // K6
  y={<B />}>
  <C />
  <D />
</A>;

let callValue = <A
  x={<B />}
  // K7
  y={f(1)}>
  <C />
</A>;

let lastProp = <A
  content={<B> <C /> </B>}
  // K8
  onClose={f}>
  <C />
</A>;
