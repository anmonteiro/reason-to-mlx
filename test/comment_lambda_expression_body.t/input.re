let a = useEffect1(() => {
  // c1
  if (x) {
    foo();
  };
  None;
}, [|x|]);
let b = fetch(~reloadIntervalSecs=30, () =>
  // c2
  SiApi.checkEvents(x)
);
let c = xs->List.map(x => {
  // c3
  x->foo;
});
let d = xs->List.map(x =>
  // c4
  <div> {React.string(x)} </div>
);
let e = useEffect1(() => {
  // c5
  switch (x) {
  | A => ()
  | B => ()
  };
}, [|x|]);
