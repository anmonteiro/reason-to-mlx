let (let.await) = (promise, fn) => fn(promise);
let (and.await) = (left, right) => (left, right);

let useLabels = (~method, ~match) => (method, match);

let labels = useLabels(~method="method", ~match="match");
