let a = (~children) => <Foo children />;
let b = (~x) => <Foo children=x label="l" />;
let c = (~x) => <div children=x />;
let d = (~x) => <Foo children=[<span />, <span />] />;
let e = (~children) => <Foo> ...children </Foo>;
let f = (~xs) => <div> ...(List.map(f, xs)) </div>;
