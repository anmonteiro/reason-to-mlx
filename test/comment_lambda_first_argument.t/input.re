let a = xs->List.map(x => {
  // c1
  let y = x;
  y;
});
let b = List.map(x => {
  // c2
  let y = x;
  y;
}, xs);
let c = useEffect1(() => {
  // c3
  let y = 1;
  y;
}, [|a|]);
let d = xs->List.map(((k, {title, fields})) => {
  // c4
  let y = 1;
  y;
});
let e = <div>
  {xs->List.map(((k, {title, fields})) => {
    // c5
    let y = 1;
    y;
  })}
</div>;
